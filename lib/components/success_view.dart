import 'package:bloc_booking_app/bloc/bloc/booking_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuccessView extends StatelessWidget {
  const SuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.check_circle, color: Colors.green, size: 100),
          const SizedBox(height: 20),
          const Text('Booking Confirmed!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text('Your itinerary has been reserved.'),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () => context.read<BookingBloc>().add(FetchPackages()),
            child: const Text('Book Another Package'),
          ),
        ],
      ),
    );
  }
}
