import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:share/share.dart';

import '../widgets/appBar.dart';
import '../widgets/footer.dart';
import '../widgets/buttons.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // Track the hovered step

  Future<void> _downloadCatalog(String assetPath, String fileName) async {
    try {
      // Load the asset
      final ByteData data = await rootBundle.load(assetPath);
      final List<int> bytes = data.buffer.asUint8List();

      // Get the directory to save the file
      final Directory directory = await getApplicationDocumentsDirectory();
      final File file = File('${directory.path}/$fileName');

      // Write the bytes to the file
      await file.writeAsBytes(bytes);

      // Share the file
      Share.shareFiles([file.path], text: 'Download ${fileName.split('.').first}');
    } catch (e) {
      // Handle the error
      print('Error downloading $fileName: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        // Wrap the entire body in a scrollable container
        child: Column(
          children: <Widget>[
            how(),
            _buildMainTitle(),
            // Cards displayed in a Row
            _buildStepCards(),
            _buildSignUpButton(),
            _buildAdditionalInfo(),
            _buildMainDownload(),
            _buildDownloadButtons(), // Add the download buttons here
            Footer(context, footerText: ''),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationButton(BuildContext context, String label, String route) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
      child: Text(
        label,
        style: const TextStyle(fontSize: 18, color: Colors.black),
      ),
    );
  }
  Widget _buildMainTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 150.0, horizontal: 20.0),
      child: Align(
        alignment: Alignment.centerLeft, // Align text to the left
        child: SizedBox(
          width: 550,
          child: Text(
            'A step by step guide on how to work with Vertidas',
            style: const TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.left, // Align text inside the widget to the left
          ),
        ),
      ),
    );
  }


  Widget _buildMainDownload() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 150.0),
      child: SizedBox(
        width: 500,
        child: Text(
          'Download Guides',
          style: TextStyle(
            fontSize: 55,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          textAlign: TextAlign.start,
        ),
      ),
    );
  }

  Widget how() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 150.0),
      child: SizedBox(
        width: 350,
        child: Text(
          '',
          style: TextStyle(
            fontSize: 55,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          textAlign: TextAlign.start,
        ),
      ),
    );
  }

  Widget _buildStepCards() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Evenly distribute the cards
          children: <Widget>[

            _buildStepCard('Step 1', 'Submit design', 'Freely create your own garments.'),
            _buildStepCard('Step 2', 'Approve the quote', 'You’ll receive a quotation for production costs.'),
            _buildStepCard('Step 3', 'Request a sample', 'Before production, you may approve a sample.'),
            _buildStepCard('Step 4', 'Produce in bulk', 'Seamlessly produce on-demand as few as 50cps.'),
          ],
        ),
      ),
    );
  }

  Widget _buildStepCard(String step, String title, String description) {
    return SizedBox(
      height: 300,
      width: 250,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                step,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildAdditionalInfo() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'How to create a project on Labwear OS',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 10),
          SizedBox(
            width: 350,
            child: Text(
              'Freely create garments with custom patterns. High-quality mono-fibre fabrics. Custom colours, dyes & washes. Endless range of design elements like prints, embroideries, patches, pockets, sunfades, distressing...',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDownloadButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildDownloadButton('Download Catalog', 'assets/cat/file.pdf', 'file.pdf'),
          const SizedBox(width: 20),

        ],
      ),
    );
  }

  Widget _buildDownloadButton(String buttonText, String assetPath, String fileName) {
    return ElevatedButton.icon(
      onPressed: () => _downloadCatalog(assetPath, fileName),
      icon: const Icon(Icons.folder_open),
      label: Text(buttonText),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, backgroundColor: Colors.blue,
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
    );
  }
}
