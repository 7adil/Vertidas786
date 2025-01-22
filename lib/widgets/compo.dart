import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class CircleLabel extends StatelessWidget {
  final String text;
  const CircleLabel({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blueAccent,
        ),
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
} // Data Row with Circles
class DataRowWithCircles extends StatelessWidget {
  final String label;
  final List<String> values;
  const DataRowWithCircles({super.key, required this.label, required this.values});
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(label, textAlign: TextAlign.left),
        ),
        ...values.map(
              (value) => CircleLabel(text: value),
        ),
      ],
    );
  }
} // Fit Option Row with Checkbox
class FitOptionRow extends StatelessWidget {
  final String label;
  final bool isSelected;
  final ValueChanged<bool?> onChanged;
  const FitOptionRow({super.key, required this.label, required this.isSelected, required this.onChanged});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isSelected,
          onChanged: (bool? value) {
            onChanged(value);
          },
        ),
        Expanded(
          child: Text(
            label,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}

// Size chart data for Regular Fit, Boxy Fit, etc.
final Map<String, List<List<String>>> sizeCharts = {
  'Regular fit': [
    ['63', '65', '67', '69', '71', '73', '75'], // Total Length
    ['42', '45', '48', '51', '54', '57', '60'], // Chest Width
    ['42', '45', '48', '51', '54', '57', '60'], // Bottom Width
    ['17', '18', '19', '20', '21', '22', '23'], // Sleeve Length
    ['21', '22', '23', '24', '25', '26', '27'], // Armhole
    ['15.5', '16', '16.5', '17', '17.5', '18', '18.5'], // Sleeve Opening
    ['2', '2', '2', '2', '2', '2', '2'], // Neck Rib Length
    ['18', '18', '18', '18', '18', '18', '18'], // Neck Opening
    ['34', '37', '40', '43', '46', '49', '52'], // Shoulder-to-Shoulder
  ],
  'Boxy fit': [
    ['63', '65', '67', '69', '71', '73', '75'], // Total Length
    ['58', '59', '60', '61', '62', '63', '64'], // Chest Width
    ['58', '59', '60', '61', '62', '63', '64'], // Bottom Width
    ['20', '21', '22', '23', '24', '25', '26'], // Sleeve Length
    ['23.5', '24', '24.5', '25', '25.5', '26', '26.5'], // Armhole
    ['20.5', '21', '21.5', '22', '22.5', '23', '23.5'], // Sleeve Opening
    ['2', '2', '2', '2', '2', '2', '2'], // Neck Rib Length
    ['18', '18', '18', '18', '18', '18', '18'], // Neck Opening
    ['57', '58', '59', '60', '61', '62', '63'], // Shoulder-to-Shoulder
  ],
  'Relaxed Fit': [
    ['63', '65', '67', '69', '71', '73', '75'], // Total Length (A)
    ['50', '52', '54', '56', '58', '60', '62'], // Chest Width (B)
    ['50', '52', '54', '56', '58', '60', '62'], // Bottom Width (C)
    ['18', '19', '20', '21', '22', '23', '24'], // Sleeve Length (D)
    ['22.5', '23', '23.5', '24', '24.5', '25', '25.5'], // Armhole (E)
    ['18.5', '19', '19.5', '20', '20.5', '21', '21.5'], // Sleeve Opening (F)
    ['2.5', '2.5', '2.5', '2.5', '2.5', '2.5', '2.5'], // Neck Rib Length (G)
    ['18.5', '18.5', '18.5', '18.5', '18.5', '18.5', '18.5'], // Neck Opening (H)
    ['49', '51', '53', '55', '57', '59', '61'], // Shoulder-to-Shoulder (I)
  ],
  'Cropped (1/2 Sleeve) Fit': [
    ['61', '63', '65', '67', '69', '71', '73'], // Total Length (A)
    ['56', '57', '58', '59', '60', '61', '62'], // Chest Width (B)
    ['56', '57', '58', '59', '60', '61', '62'], // Bottom Width (C)
    ['22', '23', '24', '25', '26', '27', '28'], // Sleeve Length (D)
    ['23.5', '24', '24.5', '25', '25.5', '26', '26.5'], // Armhole (E)
    ['18.5', '19', '19.5', '20', '20.5', '21', '21.5'], // Sleeve Opening (F)
    ['2.5', '2.5', '2.5', '2.5', '2.5', '2.5', '2.5'], // Neck Rib Length (G)
    ['18.5', '18.5', '18.5', '18.5', '18.5', '18.5', '18.5'], // Neck Opening (H)
    ['55', '56', '57', '58', '59', '60', '61'], // Shoulder-to-Shoulder (I)
  ],
  'Zero Waste 1.0': [
    ['0', '0', '60', '0', '69', '0', '0'], // Total Length (A)
    ['0', '0', '56', '0', '56', '0', '0'], // Chest Width (B)
    ['0', '0', '56', '0', '56', '0', '0'], // Bottom Width (C)
    ['0', '0', '18', '0', '21', '0', '0'], // Sleeve Length (D)
    ['0', '0', '25', '0', '25', '0', '0'], // Armhole (E)
    ['0', '0', '25', '0', '25', '0', '0'], // Sleeve Opening (F)
    ['0', '0', '2', '0', '2', '0', '0'], // Neck Rib Length (G)
    ['0', '0', '18', '0', '18', '0', '0'], // Neck Opening (H)
    ['0', '0', '56', '0', '56', '0', '0'], // Shoulder-to-Shoulder (I)
  ],
};



class ImageCard extends StatefulWidget {
  final String title;
  final Color color;
  final double width;

  const ImageCard({
    super.key,
    required this.title,
    required this.color,
    this.width = 200.0,
  });

  @override
  _ImageCardState createState() => _ImageCardState();
}

class _ImageCardState extends State<ImageCard> {
  String? _selectedLabelOption;
  File? _uploadedImage;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _uploadedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      color: widget.color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        width: widget.width,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            // Add checkboxes
            const Text(
              'Options:',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
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
            const Spacer(), // Push the image and upload button to the bottom
            if (_uploadedImage != null)
              Center(
                child: Image.file(
                  _uploadedImage!,
                  width: 100, // Set the width of the uploaded image
                  height: 100, // Set the height of the uploaded image
                  fit: BoxFit.cover,
                ),
              )
            else if (_selectedLabelOption != null)
              Center(
                child: Image.asset(
                  _selectedLabelOption == 'Inseam loop label'
                      ? 'assets/images/label2.png'
                      : 'assets/images/label1.png',
                  width: 100, // Set the width of the default image
                  height: 100, // Set the height of the default image
                  fit: BoxFit.cover,
                ),
              ),
            const SizedBox(height: 12.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter image description',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                contentPadding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
              ),
            ),
            const SizedBox(height: 12.0),
            Center(
              child: IconButton(
                onPressed: _pickImage,
                icon: const Icon(Icons.upload, size: 30.0, color: Colors.blue),
                tooltip: 'Upload Image',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// appBar: AppBar(
// title: const Text('T-Shirt Design Page'),
// actions: [
// ColorfulOvalButton(label: 'Fit', route: '/fit'),
// ColorfulOvalButton(label: 'Fabric', route: '/fabric'),
// ColorfulOvalButton(label: 'Color', route: '/color'),
// ColorfulOvalButton(label: 'Way', route: '/way'),
// ColorfulOvalButton(label: 'Neck Label', route: '/neckLabel'),
// ColorfulOvalButton(label: 'Care Label', route: '/careLabel'),
// ColorfulOvalButton(label: 'Embellishment', route: '/embellishment'),
// ColorfulOvalButton(label: 'Finishing', route: '/finishing'),
// ColorfulOvalButton(label: 'Quantity', route: '/quantity'),
// ColorfulOvalButton(label: 'Packing', route: '/packing'),
// ],
// ),