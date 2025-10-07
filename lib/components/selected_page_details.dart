import 'package:bloc_booking_app/domain/models/package.dart';
import 'package:flutter/material.dart';

class SelectedPackageDetails extends StatelessWidget {
  final Package package;
  const SelectedPackageDetails({super.key, required this.package});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(package.name,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          Text(package.description, style: const TextStyle(fontSize: 15))
        ],
      ),
    );
  }
}
