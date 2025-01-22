import 'package:flutter/material.dart';
import 'package:vertidasa/views/selectproduct.dart';

class Design extends StatefulWidget {
  const Design({super.key});

  @override
  _DesignState createState() => _DesignState();
}

class _DesignState extends State<Design> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2), // Animation duration
    )..repeat(reverse: true); // Loop the animation

    _scaleAnimation = Tween<double>(begin: 0.9, end: 1.1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Button Page"),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _scaleAnimation,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ClothingGridPage()),
                  );
                },
                icon: const Icon(
                  Icons.touch_app,
                  size: 30, // Increased icon size
                  color: Colors.white, // Icon color
                ),
                label: const Text(
                  "Go to Next Page",
                  style: TextStyle(
                    fontSize: 20.0, // Increased font size
                    color: Colors.white, // Text color
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Button color
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20), // Larger size
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0), // Square shape
                  ),
                  elevation: 8.0, // Increased shadow
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
