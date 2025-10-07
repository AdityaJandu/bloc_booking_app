import 'package:bloc_booking_app/domain/models/package.dart';
import 'package:flutter/material.dart';

class PackageCard extends StatelessWidget {
  final Package package;
  final bool isSelected;
  final VoidCallback onTap;

  const PackageCard(
      {super.key,
      required this.package,
      required this.isSelected,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: isSelected ? 8 : 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
              color: isSelected ? Colors.teal : Colors.transparent, width: 3),
        ),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(package.imageUrl,
                    width: double.infinity, fit: BoxFit.cover),
              ),
              const SizedBox(height: 8),
              Text(package.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis),
              const SizedBox(height: 4),
              Text('\$${package.basePrice.toStringAsFixed(2)} / person',
                  style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: 4),
            ],
          ),
        ),
      ),
    );
  }
}
