part of 'booking_bloc.dart';

@immutable
sealed class BookingState extends Equatable {
  const BookingState();
  @override
  List<Object?> get props => [];
}

class BookingInitial extends BookingState {}

class BookingLoading extends BookingState {}

class BookingLoaded extends BookingState {
  final List<Package> packages;
  final Package? selectedPackage;
  final int numberOfTravelers;
  final double totalPrice;

  const BookingLoaded({
    required this.packages,
    this.selectedPackage,
    this.numberOfTravelers = 1,
    this.totalPrice = 0.0,
  });

  BookingLoaded copyWith({
    List<Package>? packages,
    Package? selectedPackage,
    int? numberOfTravelers,
  }) {
    final newSelectedPackage = selectedPackage ?? this.selectedPackage;
    final newNumberOfTravelers = numberOfTravelers ?? this.numberOfTravelers;
    final newTotalPrice =
        (newSelectedPackage?.basePrice ?? 0.0) * newNumberOfTravelers;

    return BookingLoaded(
      packages: packages ?? this.packages,
      selectedPackage: newSelectedPackage,
      numberOfTravelers: newNumberOfTravelers,
      totalPrice: newTotalPrice,
    );
  }

  @override
  List<Object?> get props =>
      [packages, selectedPackage, numberOfTravelers, totalPrice];
}

class BookingSuccess extends BookingState {}

class BookingFailure extends BookingState {
  final String error;
  const BookingFailure(this.error);
  @override
  List<Object?> get props => [error];
}
