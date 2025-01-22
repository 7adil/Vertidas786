import 'dart:async';
import 'package:flutter/material.dart';

class ImageSliderPage extends StatefulWidget {
  const ImageSliderPage({super.key});

  @override
  _ImageSliderPageState createState() => _ImageSliderPageState();
}

class _ImageSliderPageState extends State<ImageSliderPage> {
  final List<String> imagePaths = [
    'assets/images/ae1eb4_f88eb6a031c64d4399605c675c963542mv2.jpg',
    'assets/images/ae1eb4_691845f9af724a69b4db13f88e73b104mv2.jpg',
    'assets/images/ae1eb4_ddc4423876ba4295ad00bab5ac0dc7e1mv2.jpeg',
    'assets/images/ae1eb4_130315fb449945ce9305ac37cb350e61mv2.jpeg',
   'assets/images/ae1eb4_72982dc2b9e4414dbc110605c479326amv2.jpg',
    'assets/images/ae1eb4_20288fe83cf1480381d4a98ba54c975cmv2.jpg',
   'assets/images/ae1eb4_f5bb4a7802d5410caccf89123440946amv2.jpeg',
         'assets/images/ae1eb4_eb3ff9efec074b63979f3d488b07fa04mv2.jpg',
         'assets/images/ae1eb4_e26bc12af7d640c4b9e53cfa4ebec34amv2.jpeg',
        ' assets/images/ae1eb4_bd284efad3134509af2450ec01556257mv2.jpg',
      '   assets/images/ae1eb4_b65a372353c0454c84bc2b1725d2ed2emv2.jpg',
      '   assets/images/ae1eb4_130315fb449945ce9305ac37cb350e61mv2.jpeg',
     '    assets/images/ae1eb4_3836f39cd63e4679b7971a8f0427bc3dmv2.jpeg',
         'assets/images/ae1eb4_16e985d8595a44e09b9f0062de043dfbmv2.jpg',
       '  assets/images/ae1eb4_08b3c11a7f8f400d857836ab41e53484mv2.jpg',
       ' assets/images/ae1eb4_6eae0e3b7fd2483594c96e8c62b16660mv2.jpg',
        ' assets/images/ae1eb4_5f61cecce8a642258887420df63971a7mv2.jpg',
       '  assets/images/ae1eb4_4cb2514472174046bb463f434315bca5mv2.jpg',
        ' assets/images/ae1eb4_0ba40a5812a94f40af57bbae0414043emv2.jpg',

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

