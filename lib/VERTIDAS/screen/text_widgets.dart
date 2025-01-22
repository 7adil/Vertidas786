import 'package:flutter/material.dart';
import 'package:video/screen/video_screen.dart';
import 'package:video/screen/workers_sliders.dart';
import 'background_images.dart';
import 'boxes.dart';
import 'company_icons_widget.dart';
import 'images_widget.dart';

class vertidas extends StatefulWidget {
  const vertidas({super.key});

  @override
  _vertidasState createState() => _vertidasState();
}

class _vertidasState extends State<vertidas> {
  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Button Page"),
      ),
      body: Container(

        color: Colors.green,
        child: Center(
          child: SingleChildScrollView(
            child: Column(

              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               const BackgroundVideoWidget(),

                Padding(
                  padding: const EdgeInsets.only(right: 1000.0, top: 50, left: 75),
                  child: const Text(
                    'Join the manufacturing platform of the future',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 55,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 820.0, top: 0, left: 39),
                  child: const Text(
                    'Where brands from around the globe are bringing their product vision to reality. A playground of imagination, creativity, and radical innovation.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontFamily: 'Roboto',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),


                const SizedBox(height: 30),
                Container(
                  width:double.infinity,
                  constraints: BoxConstraints(
                    minHeight: screenHeight * 0.9,
                  ),
                  padding: const EdgeInsets.only(top: 90),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Manufacturing-as-a-Service',
                        style: TextStyle(fontSize: 44, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: const Text(
                          'Emerging designers and established fashion brands alike are using LabwearOS to freely create, sample, and produce garments.',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: screenHeight * 0.3,
                        width: double.infinity,
                        child: const ImageSliderPage(),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 20),
                            width: screenWidth * 0.48,
                            height: 600,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      flex: 2,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 51, right: 0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.blue.shade900,
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          width: 60,
                                          height: 60,
                                          child: Center(
                                            child: Image.asset(
                                              'assets/images/vector3-Photoroom.png',
                                              
                                              width: 40,
                                              height: 40,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 215),
                                    Flexible(
                                      flex: 2,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 85, right: 0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.blue.shade900,
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          width: 60,
                                          height: 60,
                                          child: Center(
                                            child: Image.asset(
                                              'assets/images/vector5-Photoroom.png',
                                              width: 40, //
                                              height: 40,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 50),
                                      child: Text(
                                        'Low MOQ',
                                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    const SizedBox(width: 215),
                                    Flexible(
                                      flex: 2,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 21, right: 0),
                                        child: Text(
                                          'Real-Time Tracking',
                                          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 50, right: 0),
                                        child: Text(
                                          'Starting from 50 units, our on-demand production ensures you get what you need at low MOQs.',
                                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 55, right: 0),
                                        child: Text(
                                          'Stay up-to-date at all times to see the exact production stage your order is at right now.',
                                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 50),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      flex: 2,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 51, right: 0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.blue.shade900,
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          width: 60,
                                          height: 60,
                                          child: Center(
                                            child: Image.asset(
                                              'assets/images/vector-Photoroom.png',
                                              width: 40,
                                              height: 40,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 215),
                                    Flexible(
                                      flex: 2,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 85, right: 0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.blue.shade900,
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          width: 60,
                                          height: 60,
                                          child: Center(
                                            child: Image.asset(
                                              'assets/images/vector2 (1)-Photoroom.png',
                                              width: 40,
                                              height: 40,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 50),
                                      child: Text(
                                        'Audited Manufacturing',
                                        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    const SizedBox(width: 60),
                                    Flexible(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 0, right: 0),
                                        child: Text(
                                          'On-demand Assistance',
                                          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 50, right: 0),
                                        child: Text(
                                          'Starting from 50 units, our on-demand production ensures you get what you need at low MOQs.',
                                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 55, right: 0),
                                        child: Text(
                                          'Stay up-to-date at all times to see the exact production stage your order is at right now.',
                                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 20),
                          Container(
                           // alignment: Alignment.center,
                            padding: const EdgeInsets.only(left: 90), // No padding if not needed
                            child: Center(
                              child: Image.asset(
                                'assets/images/laptop.png', // Replace with your actual image path
                                width: 560, // Width of the image
                                height: 560, // Height of the image
                                fit: BoxFit.contain, // Adjust the image's fit as required (optional)
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: const Text(
                          'Trusted by',
                          style: TextStyle(fontSize: 20, ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 0),
                      SizedBox(
                        height: 180,
                        width: double.infinity,
                        child: const CompanyIconsWidget(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 100),
                            width: screenWidth * 0.48,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 0),
                                  child: Text(
                                    'Push designs direct to production',
                                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                const Padding(
                                  padding: EdgeInsets.only(right: 220),
                                  child: Text(
                                    'At the heart of LabwearOS is an engine that converts any design you create on the front end into production-ready tech sheets on the factory back end ensuring reliable and fast execution. Keep track of your order all the way from production start to Fedex delivering it to your warehouse.',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 20),
                          Container(
                            padding: const EdgeInsets.only(left: 30),
                            child: Image.asset(
                              'assets/images/factory.png',
                              width: 560,
                              height: 560,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),],
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.6,
                  width: double.infinity,
                  child: const BackgroundImages(),
                ),
                SizedBox(
                  height: 150,
                  width: double.infinity,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 800.0, top: 70),
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              'How it works',
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 215.0),
                              child: Text(
                                'Get your collection produced in 5 easy steps.',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),

                           // const SizedBox(height: 420),
                          ],
                        ),
                      ),

                    ),
                  ),

                ),
                SizedBox(
                  height: screenHeight * 0.36,
                  width: double.infinity,
                  child: const Boxes(),
                ),
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  height: 200,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 700.0,right: 700,top: 50,bottom: 100),
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent.shade700,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.6,
                  width: double.infinity,
                  child: const BackgroundImage2(),
                ),
                Container(
                  width: double.infinity,
                  height: 450,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Access the LWS supply network',
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 420.0),
                          child: Text(
                            'We work with a vetted network of manufacturing partners and train dedicated personnel who ensures that factories uphold the highest quality standards. We’ve developed comprehensive systems for selecting and supporting our suppliers to ensure we deliver high-quality garments over and over again.',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 4),
                        Image.asset(
                          'assets/images/factory2.png',
                          height: 200,
                          width: 600,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 1.5,
                  width: double.infinity,
                  child: const WorkersSliders(),
                ),
                const SizedBox(height: 60),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
