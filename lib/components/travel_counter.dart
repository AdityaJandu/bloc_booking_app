import 'package:flutter/material.dart';

class TravelerCounter extends StatelessWidget {
  final int count;
  final ValueChanged<int> onChanged;
  const TravelerCounter(
      {super.key, required this.count, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Number of Travelers:', style: TextStyle(fontSize: 16)),
          Row(
            children: [
              IconButton(
                  icon: const Icon(Icons.remove_circle_outline),
                  onPressed: () => onChanged(count - 1)),
              Text('$count',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold)),
              IconButton(
                  icon: const Icon(Icons.add_circle_outline),
                  onPressed: () => onChanged(count + 1)),
            ],
          ),
        ],
      ),
    );
  }
}
