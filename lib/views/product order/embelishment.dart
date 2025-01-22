import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

import '../../widgets/buttons.dart';
import 'finishing.dart';

class Establishment extends StatefulWidget {
  @override
  _EstablishmentState createState() => _EstablishmentState();
}

class _EstablishmentState extends State<Establishment> {
  File? _selectedImage;

  Future<void> _chooseImage(BuildContext context) async {
    try {
      final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        setState(() {
          _selectedImage = File(pickedImage.path);
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Image selected: ${_selectedImage!.path}')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('No image selected')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error selecting image: $e')),
      );
    }
  }

  Future<void> _uploadImage(BuildContext context) async {
    if (_selectedImage != null) {
      try {
        var uri = Uri.parse('YOUR_BACKEND_ENDPOINT');  // Replace with your backend server URL

        var request = http.MultipartRequest('POST', uri)
          ..files.add(http.MultipartFile(
            'image',
            _selectedImage!.readAsBytes().asStream(),
            _selectedImage!.lengthSync(),
            filename: _selectedImage!.path.split('/').last,
          ));

        var response = await request.send();

        if (response.statusCode == 200) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Image uploaded successfully')),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to upload image')),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error uploading image: $e')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select an image to upload')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Customizations Page'),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isMobile = constraints.maxWidth < 600;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Add Customizations Like Prints',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'To make sure we get it right, please do the following:',
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  isMobile
                      ? Column(
                    children: _buildCards(context, isMobile),
                  )
                      : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _buildCards(context, isMobile),
                  ),  Align(
                    alignment: Alignment.bottomCenter,
                    child: CustomButton(
                      buttonText: 'Save & Next',
                      icon: Icons.arrow_forward,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Finishing()),
                        );
                      },
                      color: Colors.blue,
                      textColor: Colors.white,
                      iconSize: 24.0,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  List<Widget> _buildCards(BuildContext context, bool isMobile) {
    return [
      Expanded(
        flex: isMobile ? 0 : 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              elevation: 4,  color: Colors.grey[200],
              margin: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text(
                      '1. Download the template and add your design',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Image.asset(
                      'assets/images/empty_tshirt.png',
                      height: 200,
                      width: 400,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton.icon(
                      onPressed: () => _downloadTemplate(context),
                      icon: const Icon(Icons.download, size: 20),
                      label: const Text('Download Template'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Card(color: Colors.grey[200],
              elevation: 4,
              margin: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text(
                      '2. Upload edited template with your design',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    _selectedImage != null
                        ? Image.file(
                      _selectedImage!,
                      height: 200,
                      width: 400,
                      fit: BoxFit.cover,
                    )
                        : Image.asset(
                      'assets/images/custom_tshirt.png',
                      height: 200,
                      width: 400,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton.icon(
                      onPressed: () => _chooseImage(context),
                      icon: const Icon(Icons.file_upload, size: 20),
                      label: const Text('Upload Image'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                      ),
                    ),
                    const SizedBox(height: 10),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      const SizedBox(width: 16.0),
      Expanded(
        flex: isMobile ? 0 : 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(color: Colors.grey[200],
              elevation: 4,
              margin: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: const Text(
                  '''
There are only 3 rules of thumb:
1. Your designs must be vectorized.
2. Indicate logo colors with Pantone TCX codes (e.g. Pantone 18-6028 TCX).
3. Indicate positioning with distance measurements.
      ''',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Card(color: Colors.grey[200],
              elevation: 4,
              margin: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text(
                      'Add Your Comments or Notes:',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      maxLines: 5,
                      decoration: InputDecoration(
                        hintText: 'Enter your text here...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    ];
  }
  Future<void> _downloadTemplate(BuildContext context) async {
    const url = 'https://drive.google.com/file/d/1s2Nh21bJt8RjGdpW3MjkVLiuvPDz-b-9/view';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var directory = await getExternalStorageDirectory();
        final filePath = '${directory!.path}/template.pdf';

        File file = File(filePath);
        await file.writeAsBytes(response.bodyBytes);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('PDF downloaded to $filePath')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to download PDF')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error downloading PDF: $e')),
      );
    }
  }}
