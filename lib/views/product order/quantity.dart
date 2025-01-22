import 'package:flutter/material.dart';

class QA extends StatefulWidget {
  const QA({super.key});

  @override
  State<QA> createState() => _QAState();
}

class _QAState extends State<QA> {
  final Map<String, TextEditingController> sizeControllers = {};
  final List<String> sizes = [
    'XXS',
    'XS',
    'S',
    'M',
    'L',
    'XL',
    'XXL',
    'XXXL',
    'XXXXL',
    'XXXXXL',
  ];

  String? selectedOption; // Tracks the selected radio button

  @override
  void initState() {
    super.initState();
    // Initialize a TextEditingController for each size
    for (var size in sizes) {
      sizeControllers[size] = TextEditingController();
    }
  }

  @override
  void dispose() {
    // Dispose of all controllers when the widget is disposed
    for (var controller in sizeControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Customize Quantities'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // New Card with Radio Buttons
            Card(color: Colors.grey[200],
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Do you want a sample first?',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'You have the option to order a sample for avg. 200€. (recommended)',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 16),
                    RadioListTile<String>(
                      title: const Text('Yes'),
                      value: 'Yes',
                      groupValue: selectedOption,
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value;
                        });
                      },
                    ),
                    RadioListTile<String>(
                      title: const Text('No'),
                      value: 'No',
                      groupValue: selectedOption,
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Horizontal Scrollable Row of Cards
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: sizes.map((size) {
                    return Container(
                      width: 150, // Adjusted width for smaller cards
                      margin: const EdgeInsets.only(right: 16.0), // Space between cards
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        color: Colors.grey[200], // Slight background color for better visuals
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                size,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 8),
                              TextField(
                                controller: sizeControllers[size],
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  labelText: 'Quantity',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  isDense: true,
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                    horizontal: 10,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Submit Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Collect data from all controllers
                  final Map<String, String> enteredQuantities = {};
                  sizeControllers.forEach((key, controller) {
                    enteredQuantities[key] = controller.text;
                  });
                  print('Entered Quantities: $enteredQuantities');
                  // Perform further actions (e.g., save or process the data)
                },
                style: ElevatedButton.styleFrom(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  backgroundColor: Colors.blueAccent, // Button color
                ),
                child: const Text(
                  'Submit',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
