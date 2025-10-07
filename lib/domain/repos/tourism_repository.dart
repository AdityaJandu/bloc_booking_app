import 'package:bloc_booking_app/domain/models/package.dart';

// Abstract class means only defining functions to be implemented in data layer:
abstract class TourismRepository {
  // Get Packages:
  Future<List<Package>> getPackages();

  // Submit booking:
  Future<bool> submitBooking(Package package, int numberOfTravelers);
}
