import 'package:bloc_booking_app/domain/models/package.dart';
import 'package:bloc_booking_app/domain/repos/tourism_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'booking_event.dart';
part 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  final TourismRepository _tourismRepository;

  BookingBloc(this._tourismRepository) : super(BookingInitial()) {
    on<FetchPackages>(_onFetchPackages);
    on<SelectPackage>(_onSelectPackage);
    on<UpdateTravelerCount>(_onUpdateTravelerCount);
    on<ConfirmBooking>(_onConfirmBooking);
  }

  void _onFetchPackages(FetchPackages event, Emitter<BookingState> emit) async {
    emit(BookingLoading());
    try {
      final packages = await _tourismRepository.getPackages();
      emit(BookingLoaded(packages: packages));
    } catch (e) {
      emit(BookingFailure(e.toString()));
    }
  }

  void _onSelectPackage(SelectPackage event, Emitter<BookingState> emit) {
    if (state is BookingLoaded) {
      final currentState = state as BookingLoaded;
      emit(currentState.copyWith(selectedPackage: event.package));
    }
  }

  void _onUpdateTravelerCount(
      UpdateTravelerCount event, Emitter<BookingState> emit) {
    if (state is BookingLoaded) {
      final currentState = state as BookingLoaded;
      // Ensure traveler count is at least 1
      final newCount = event.count > 0 ? event.count : 1;
      emit(currentState.copyWith(numberOfTravelers: newCount));
    }
  }

  void _onConfirmBooking(
      ConfirmBooking event, Emitter<BookingState> emit) async {
    if (state is BookingLoaded) {
      final currentState = state as BookingLoaded;
      if (currentState.selectedPackage == null) {
        emit(const BookingFailure('Please select a package before booking.'));
        // Re-emit the loaded state to keep the UI interactive
        emit(currentState);
        return;
      }

      emit(BookingLoading());
      try {
        await _tourismRepository.submitBooking(
          currentState.selectedPackage!,
          currentState.numberOfTravelers,
        );
        emit(BookingSuccess());
      } catch (e) {
        emit(BookingFailure(e.toString()));
        // After failure, go back to the loaded state so the user can try again
        emit(currentState);
      }
    }
  }
}
