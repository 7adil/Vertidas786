import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const BackgroundImages());
// }

class BackgroundImages extends StatelessWidget {
  const BackgroundImages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/273c97_8c88f6d1fc2c48b2801f66e1970e02e6mv2.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
class BackgroundImage2 extends StatelessWidget {
  const BackgroundImage2({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/Aae1eb4_806e42b053834439b1a040b20ef186b8mv2.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}