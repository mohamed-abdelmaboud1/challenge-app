import 'package:flutter/material.dart';

class DismissBackground extends StatelessWidget {
  final bool isLeft;

  const DismissBackground({super.key, required this.isLeft});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: isLeft ? Colors.green : Colors.red,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Align(
        alignment: isLeft ? Alignment.centerLeft : Alignment.centerRight,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                isLeft ? Icons.check_circle : Icons.delete,
                color: Colors.white,
                size: 32,
              ),
              const SizedBox(height: 4),
              Text(
                isLeft ? 'Complete' : 'Delete',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
