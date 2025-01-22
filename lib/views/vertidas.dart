import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ManufacturingPage extends StatefulWidget {
  const ManufacturingPage({super.key});

  @override
  _ManufacturingPageState createState() => _ManufacturingPageState();
}

class _ManufacturingPageState extends State<ManufacturingPage> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/background_video.mp4');
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.play();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // First Section with Background Video
            SizedBox(
              height: MediaQuery.of(context).size.height, // Full-screen height for the video
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // Background Video
                  FutureBuilder(
                    future: _initializeVideoPlayerFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return VideoPlayer(_controller);
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                  // Overlay Content
                  Container(
                    color: Colors.black.withOpacity(0.5),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Join the manufacturing\nplatform of the\nfuture',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              'Join the manufacturing platform of the future\n'
                                  'where brands from around the globe are bringing their product vision to reality.\n'
                                  'A playground of imagination, creativity, and radical innovation.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Second Section with White Background
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center, // Center align the content
                children: [
                  Text(
                    'Manufacturing-as-a-Service',
                    textAlign: TextAlign.center, // Center align the text
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Emerging designers and established fashion brands alike are using LabwearOS to freely create, sample, and produce garments.',
                    textAlign: TextAlign.center, // Center align the text
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Add your action here
                    },
                    child: Text('Learn More'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
