import 'package:bloc_booking_app/bloc/bloc/booking_bloc.dart';
import 'package:bloc_booking_app/components/booking_summary.dart';
import 'package:bloc_booking_app/components/package_card.dart';
import 'package:bloc_booking_app/components/selected_page_details.dart';
import 'package:bloc_booking_app/components/success_view.dart';
import 'package:bloc_booking_app/components/travel_counter.dart';
import 'package:bloc_booking_app/data/tourism_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          BookingBloc(TourismRepositoryImpl())..add(FetchPackages()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tour Booking'),
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
        ),
        body: BlocListener<BookingBloc, BookingState>(
          listener: (context, state) {
            if (state is BookingFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Error: ${state.error}'),
                  backgroundColor: Colors.redAccent,
                ),
              );
            }
          },
          child: BlocBuilder<BookingBloc, BookingState>(
            builder: (context, state) {
              if (state is BookingLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is BookingLoaded) {
                return BookingWorkflowView(state: state);
              }
              if (state is BookingSuccess) {
                return const SuccessView();
              }
              if (state is BookingInitial) {
                // Also show loader for the initial state before first load
                return const Center(child: CircularProgressIndicator());
              }
              // Fallback for an unhandled state
              return const Center(child: Text('Something went wrong!'));
            },
          ),
        ),
      ),
    );
  }
}

class BookingWorkflowView extends StatelessWidget {
  final BookingLoaded state;
  const BookingWorkflowView({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        const Center(
          child: Text(
            'Choose Your Package',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: state.packages.length,
            itemBuilder: (context, index) {
              final package = state.packages[index];
              final isSelected = state.selectedPackage?.id == package.id;
              return PackageCard(
                package: package,
                isSelected: isSelected,
                onTap: () =>
                    context.read<BookingBloc>().add(SelectPackage(package)),
              );
            },
          ),
        ),
        if (state.selectedPackage != null) ...[
          const SizedBox(height: 24),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'Customize Your Itinerary',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 16),
          SelectedPackageDetails(package: state.selectedPackage!),
          const SizedBox(height: 20),
          TravelerCounter(
            count: state.numberOfTravelers,
            onChanged: (count) =>
                context.read<BookingBloc>().add(UpdateTravelerCount(count)),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: BookingSummary(totalPrice: state.totalPrice),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () =>
                    context.read<BookingBloc>().add(ConfirmBooking()),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                child: const Text('Confirm & Reserve'),
              ),
            ),
          ),
          const SizedBox(height: 32)
        ],
      ],
    );
  }
}
