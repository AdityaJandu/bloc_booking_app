import 'package:bloc_booking_app/domain/models/package.dart';
import 'package:bloc_booking_app/domain/repos/tourism_repository.dart';
import 'package:flutter/material.dart';

class TourismRepositoryImpl implements TourismRepository {
  @override
  Future<List<Package>> getPackages() async {
    await Future.delayed(const Duration(seconds: 1));
    return const [
      Package(
        id: 'p1',
        name: 'Alpine Adventure in Switzerland',
        description:
            'Explore the majestic Swiss Alps, from scenic train rides to breathtaking mountain peaks.',
        basePrice: 2500.00,
        imageUrl: 'https://picsum.photos/seed/switzerland/400/300',
      ),
      Package(
        id: 'p2',
        name: 'Kyoto\'s Cultural Heritage',
        description:
            'Immerse yourself in the ancient temples, serene gardens, and traditional culture of Kyoto.',
        basePrice: 3200.00,
        imageUrl: 'https://picsum.photos/seed/kyoto/400/300',
      ),
      Package(
        id: 'p3',
        name: 'Safari in the Serengeti',
        description:
            'Witness the Great Migration and encounter Africa\'s most iconic wildlife in Tanzania.',
        basePrice: 4500.00,
        imageUrl: 'https://picsum.photos/seed/serengeti/400/300',
      ),
    ];
  }

  // Simulate submitting the booking to a server
  @override
  Future<bool> submitBooking(Package package, int numberOfTravelers) async {
    await Future.delayed(const Duration(seconds: 2));
    if (numberOfTravelers <= 0) {
      throw Exception('Number of travelers must be at least 1.');
    }
    // In a real app, this would be an HTTP POST request.
    // For this assignment, we just simulate success.
    debugPrint(
        'Booking submitted for ${package.name} for $numberOfTravelers travelers.');
    return true;
  }
}
