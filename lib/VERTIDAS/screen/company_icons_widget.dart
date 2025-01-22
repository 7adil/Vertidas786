import 'dart:async';
import 'package:flutter/material.dart';

class CompanyIconsWidget extends StatefulWidget {
  const CompanyIconsWidget({super.key});

  @override
  _CompanyIconsWidgetState createState() => _CompanyIconsWidgetState();
}

class _CompanyIconsWidgetState extends State<CompanyIconsWidget> {
  final List<String> imagePaths = [
    'assets/images/LOGO1.png',
    'assets/images/ae1eb4_3baa7b670c6949b3a8fda13eba95c115mv22.png',
    'assets/images/ae1eb4_0d2c34018ae948339fd3c1ca139a9e5fmv23.png',
    'assets/images/111ae1eb4_eb72a36849394b94b1453f0c97abaf23mv2.png',
    'assets/images/112ae1eb4_c22dbd1fa3db491386c810446a677035mv2.png',
    'assets/images/114ae1eb4_19c9f97020924c30985c02ae27b91277mv2.png',
    'assets/images/LOGO1.png',
    'assets/images/ae1eb4_3baa7b670c6949b3a8fda13eba95c115mv22.png',
    'assets/images/ae1eb4_0d2c34018ae948339fd3c1ca139a9e5fmv23.png',
    'assets/images/111ae1eb4_eb72a36849394b94b1453f0c97abaf23mv2.png',
    'assets/images/112ae1eb4_c22dbd1fa3db491386c810446a677035mv2.png',
    'assets/images/114ae1eb4_19c9f97020924c30985c02ae27b91277mv2.png',
  ];

  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    Timer.periodic(const Duration(milliseconds: 30), (timer) {
      if (_controller.hasClients) {
        final maxScrollExtent = _controller.position.maxScrollExtent;
        final currentScrollPosition = _controller.offset;

        if (currentScrollPosition < maxScrollExtent) {
          _controller.animateTo(
            currentScrollPosition + 2,
            duration: const Duration(milliseconds: 16),
            curve: Curves.linear,
          );
        } else {
          _controller.jumpTo(0);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            controller: _controller,
            child: Row(
              children: List.generate(
                imagePaths.length,
                    (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      imagePaths[index],
                      width: 170,
                      height: 170,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
