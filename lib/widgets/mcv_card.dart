import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final VoidCallback onTap;

  const ProductCard({super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.onTap, required bool isChecked,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center, // Center content
          mainAxisSize: MainAxisSize.min, // Keep the column from taking excess height
          children: [
            // Image inside the card
            AspectRatio(
              aspectRatio: 1,  // Keeps the image square (150x150)
              child: FittedBox(
                fit: BoxFit.contain,
                child: Image.asset(
                  imageUrl,
                  width: 150,  // Image width
                  height: 150, // Image height
                ),
              ),
            ),
            // Title text
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center, // Center text
              ),
            ),
            // Description text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              child: Text(
                description,
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center, // Center description text
              ),
            ),
          ],
        ),
      ),
    );
  }
}
