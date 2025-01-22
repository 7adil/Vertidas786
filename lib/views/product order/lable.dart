import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../widgets/buttons.dart';
import 'embelishment.dart';

class t_lable extends StatefulWidget {
  const t_lable({super.key});

  @override
  _t_lableState createState() => _t_lableState();
}
class _t_lableState extends State<t_lable> {
  String? _selectedLabelOption; // For Card 1 (Label Options)
  String? _selectedMaterialOption; // For Card 2 (Material Options)
  Color? selectedColor; // For Card 3 (Color Options)
  File? _uploadedImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Cards Page'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildCardWithLabelOptions('Card 1', Colors.grey[200]!, width: 400.0),
                  const SizedBox(height: 16.0),
                  _buildCardWithMaterialOptions('Card 2', Colors.grey[200]!, width: 400.0),
                  const SizedBox(height: 16.0),
                  _buildCardWithSelectableColors('Card 3', Colors.grey[200]!, width: 400.0),
                  const SizedBox(height: 16.0),
                ],
              ),
              const SizedBox(width: 16.0),
              _buildCardWithImages('Card 4', Colors.grey[200]!, width: 400.0),Align(
                alignment: Alignment.bottomRight, // Align the button at the bottom right
                child: CustomButton(
                  buttonText: 'Save & Next',
                  icon: Icons.arrow_forward,
                  onPressed: () {
                    // Navigate to the NextPage
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Establishment()),
                    );
                  },
                  color: Colors.blue,
                  textColor: Colors.white,
                  iconSize: 24.0, // Optional: Add an icon size if needed
                ),),
            ],
          ),
        ),
      ),
    );
  }Widget _buildCardWithImages(String title, Color color, {double width = 200.0}) {
    return Card(
      elevation: 4.0,
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        width: width,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Card title
            Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            // Options text
            const Text(
              'Options:',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            // Checkbox options
            CheckboxListTile(
              title: const Text('Inseam loop label'),
              value: _selectedLabelOption == 'Inseam loop label',
              onChanged: (value) {
                setState(() {
                  _selectedLabelOption = 'Inseam loop label';
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
            ),
            CheckboxListTile(
              title: const Text('Label on the back'),
              value: _selectedLabelOption == 'Label on the back',
              onChanged: (value) {
                setState(() {
                  _selectedLabelOption = 'Label on the back';
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
            ),
            const Spacer(), // Pushes the image and elements to the bottom
            if (_selectedLabelOption != null)
              Column(
                children: [
                  // Display selected or uploaded image
                  Center(
                    child: _uploadedImage != null
                        ? Image.file(
                      _uploadedImage!,
                      width: 300,
                      height: 300,
                      fit: BoxFit.contain,
                    )
                        : Image.asset(
                      _selectedLabelOption == 'Inseam loop label'
                          ? 'assets/images/lable2.png'
                          : 'assets/images/label1.png',
                      width: 300,
                      height: 300,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  // Text field for image description
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Enter image description',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 12.0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  // IconButton for image upload
                  IconButton(
                    onPressed: () async {
                      final picker = ImagePicker();
                      final pickedFile = await picker.pickImage(
                        source: ImageSource.gallery,
                      );
                      if (pickedFile != null) {
                        setState(() {
                          _uploadedImage = File(pickedFile.path);
                        });
                      }
                    },
                    icon: const Icon(Icons.upload, size: 30.0, color: Colors.blue),
                    tooltip: 'Upload Image',
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardWithLabelOptions(String title, Color color, {double width = 200.0}) {
    return Card(
      elevation: 4.0,
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        width: width,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select a label option',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8.0),
            RadioListTile<String>(
              value: 'No label',
              groupValue: _selectedLabelOption,
              onChanged: (value) {
                setState(() {
                  _selectedLabelOption = value;
                });
              },
              title: const Text('No label'),
            ),
            RadioListTile<String>(
              value: 'I will send labels',
              groupValue: _selectedLabelOption,
              onChanged: (value) {
                setState(() {
                  _selectedLabelOption = value;
                });
              },
              title: const Text('I will send labels'),
            ),
            RadioListTile<String>(
              value: 'Standard',
              groupValue: _selectedLabelOption,
              onChanged: (value) {
                setState(() {
                  _selectedLabelOption = value;
                });
              },
              title: const Text('Standard'),
            ),
            RadioListTile<String>(
              value: 'Custom',
              groupValue: _selectedLabelOption,
              onChanged: (value) {
                setState(() {
                  _selectedLabelOption = value;
                });
              },
              title: const Text('Custom'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardWithMaterialOptions(String title, Color color, {double width = 200.0}) {
    return Card(
      elevation: 4.0,
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        width: width,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Choose the material',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8.0),
            RadioListTile<String>(
              value: 'Woven label',
              groupValue: _selectedMaterialOption,
              onChanged: (value) {
                setState(() {
                  _selectedMaterialOption = value;
                });
              },
              title: const Text('Woven label'),
            ),
            RadioListTile<String>(
              value: 'Polyester',
              groupValue: _selectedMaterialOption,
              onChanged: (value) {
                setState(() {
                  _selectedMaterialOption = value;
                });
              },
              title: const Text('Polyester'),
            ),
            RadioListTile<String>(
              value: 'Cotton Canvas',
              groupValue: _selectedMaterialOption,
              onChanged: (value) {
                setState(() {
                  _selectedMaterialOption = value;
                });
              },
              title: const Text('Cotton Canvas'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardWithSelectableColors(String title, Color color, {double width = 200.0}) {
    List<Color> allColors = [
      Colors.red, Colors.green, Colors.blue, Colors.yellow, Colors.purple, Colors.orange,
      Colors.cyan, Colors.pink, Colors.teal, Colors.lime, Colors.indigo, Colors.amber,
      Colors.brown, Colors.grey, Colors.lightBlue, Colors.lightGreen, Colors.deepPurple, Colors.deepOrange,
      Colors.black, Colors.white
    ];

    List<Color> filteredColors = _selectedMaterialOption == 'Polyester'
        ? [Colors.black, Colors.white]
        : _selectedMaterialOption == 'Cotton Canvas'
        ? [Colors.amber]
        : allColors;

    return Card(
      elevation: 4.0,
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        width: width,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select a color',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8.0),
            Wrap(
              spacing: 12.0,
              runSpacing: 12.0,
              children: List.generate(filteredColors.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedColor = filteredColors[index];
                    });
                  },
                  child: CircleAvatar(
                    radius: 20.0,
                    backgroundColor: filteredColors[index],
                    child: selectedColor == filteredColors[index]
                        ? Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black, width: 2),
                      ),
                      child: const Icon(Icons.check, color: Colors.white),
                    )
                        : null,
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }}