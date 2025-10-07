part of 'booking_bloc.dart';

@immutable
sealed class BookingEvent extends Equatable {
  const BookingEvent();
  @override
  List<Object?> get props => [];
}

class FetchPackages extends BookingEvent {}

class SelectPackage extends BookingEvent {
  final Package package;
  const SelectPackage(this.package);
  @override
  List<Object?> get props => [package];
}

class UpdateTravelerCount extends BookingEvent {
  final int count;
  const UpdateTravelerCount(this.count);
  @override
  List<Object?> get props => [count];
}

class ConfirmBooking extends BookingEvent {}
