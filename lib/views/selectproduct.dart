import 'package:flutter/material.dart';
import '../widgets/mcv_card.dart';
import '../widgets/routes.dart';
// Import ProductCard widget

class ClothingGridPage extends StatelessWidget {
  final List<Map<String, String>> clothingItems = [
    {'image': 'assets/images/t-shirt.png', 'text': 'T-Shirt'},
    {'image': 'assets/images/hoodie.png', 'text': 'Hoodie'},
    {'image': 'assets/images/crewneck.png', 'text': 'Crewneck'},
    {'image': 'assets/images/zip-hoodie.png', 'text': 'Zip-Hoodie'},
    {'image': 'assets/images/long_sleeve.png', 'text': 'Long Sleeve'},
    {'image': 'assets/images/tank_top.png', 'text': 'Tank Top'},
    {'image': 'assets/images/trainers.png', 'text': 'Sweatpants I'},
    {'image': 'assets/images/straight_leg.png', 'text': 'Sweatpants II'},
    {'image': 'assets/images/shorts.png', 'text': 'Shorts'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("What would you like to design?"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // 3 cards per row
            crossAxisSpacing: 10, // Space between columns
            mainAxisSpacing: 10, // Space between rows
            childAspectRatio: (250 / 300), // Adjusted for better card aspect ratio
          ),
          itemCount: clothingItems.length,
          itemBuilder: (context, index) {
            return Center(
              child: ProductCard(
                imageUrl: clothingItems[index]['image']!,
                title: clothingItems[index]['text']!,
                description: 'Click to design your custom ${clothingItems[index]['text']}!',
                isChecked: false, // Default value, you can change it as needed
                onTap: () {
                  // Navigate to the specific route for the selected clothing item
                  Navigator.pushNamed(
                    context,
                    Routes.generateRouteName(clothingItems[index]['text']!),
                  );
                },
              )

            );
          },
        ),
      ),
    );
  }
}
