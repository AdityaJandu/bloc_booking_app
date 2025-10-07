import 'package:flutter/material.dart';

class BookingSummary extends StatelessWidget {
  final double totalPrice;
  const BookingSummary({super.key, required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Total Price:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Text(
          '\$${totalPrice.toStringAsFixed(2)}',
          style: const TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.teal),
        ),
      ],
    );
  }
}
