import 'package:flutter/material.dart';

import '../../widgets/buttons.dart';
import '../../widgets/compo.dart';
import 'lable.dart';

class TShirtPage extends StatefulWidget {
  @override
  _TShirtPageState createState() => _TShirtPageState();
}bool isJersey185Organic = false;
bool isJersey235Cotton = false;
bool isJersey235Organic = false;
bool isJersey295Cotton = false;
String selectedFabric = 'Cotton';
String? selectedDye; // Initially null
// Default fabric
 // Default color

final List<Color> colors = [
  Colors.red,
  Colors.green,
  Colors.blue,
  Colors.yellow,
  Colors.orange,
  Colors.purple,
  Colors.pink,
  Colors.brown,
  Colors.cyan,
  Colors.teal,
  Colors.lime,
  Colors.indigo,
  Colors.amber,
  Colors.deepOrange,
  Colors.lightBlue,
  Colors.lightGreen,
  Colors.deepPurple,
  Colors.grey,
  Colors.blueGrey,
  Colors.white,
  Colors.black,
  Colors.redAccent,
  Colors.greenAccent,
  Colors.blueAccent,
];

Color? selectedColor; // Track the selected color


class _TShirtPageState extends State<TShirtPage> {
  String selectedFit = 'Regular fit'; // Default fit option

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
        appBar: AppBar(
      title: const Text("What would you like to design?"),
      leading: Image.asset('assets/images/vertidas.jpeg'), // Image on the left side
      actions: [
        ElevatedButton(
          onPressed: () {
            // Action for Level1
          },
          child: Text('Level 1'),
        ),
        ElevatedButton(
          onPressed: () {
            // Action for Level2
          },
          child: Text('Level 2'),
        ),
        ElevatedButton(
          onPressed: () {
            // Action for Level3
          },
          child: Text('Level 3'),
        ),
        ElevatedButton(
          onPressed: () {
            // Action for Level4
          },
          child: Text('Level 4'),
        ),
      ],
      elevation: 5,
      backgroundColor: Colors.grey[200],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(16.0)),
      ),
    ),

        body: SingleChildScrollView(  // Added Scroll View here
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Row for the first two cards and the size chart card
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Column for the first two cards (Fit Options and Additional Notes)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Fit Options Card
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.20, // Adjust width as needed
                        child: Card(
                          color: Colors.grey[200],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Choose your fit',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                FitOptionRow(
                                  label: 'Regular fit',
                                  isSelected: selectedFit == 'Regular fit',
                                  onChanged: (value) {
                                    setState(() {
                                      selectedFit = 'Regular fit';
                                    });
                                  },
                                ),
                                FitOptionRow(
                                  label: 'Boxy fit',
                                  isSelected: selectedFit == 'Boxy fit',
                                  onChanged: (value) {
                                    setState(() {
                                      selectedFit = 'Boxy fit';
                                    });
                                  },
                                ),
                                FitOptionRow(
                                  label: 'Relaxed Fit',
                                  isSelected: selectedFit == 'Relaxed Fit',
                                  onChanged: (value) {
                                    setState(() {
                                      selectedFit = 'Relaxed Fit';
                                    });
                                  },
                                ),
                                FitOptionRow(
                                  label: 'Cropped (1/2 Sleeve) Fit',
                                  isSelected: selectedFit == 'Cropped (1/2 Sleeve) Fit',
                                  onChanged: (value) {
                                    setState(() {
                                      selectedFit = 'Cropped (1/2 Sleeve) Fit';
                                    });
                                  },
                                ),
                                FitOptionRow(
                                  label: 'Zero Waste 1.0',
                                  isSelected: selectedFit == 'Zero Waste 1.0',
                                  onChanged: (value) {
                                    setState(() {
                                      selectedFit = 'Zero Waste 1.0';
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10), // Spacer between Fit Options and Additional Notes

                      // Additional Notes Card
                      SizedBox(
                        height: 320,
                        width: MediaQuery.of(context).size.width * 0.20, // Adjust width as needed
                        child: Card(
                          color: Colors.grey[200],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Additional Notes',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                TextField(
                                  maxLines: 5,
                                  decoration: InputDecoration(
                                    hintText: 'Enter your additional notes here...',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(width: 5), // Spacer between the column and the size chart card

                  // Size Chart Card
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.65,
                    child: Card(
                      color: Colors.grey[200],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Row(
                        children: [
                          // Left side: DataTable
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Size Chart - $selectedFit',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: DataTable(
                                      columns: [
                                        DataColumn(label: Text('Size')),
                                        ...['XS', 'S', 'M', 'L', 'XL', '2XL', '3XL']
                                            .map((size) => DataColumn(label: Text(size)))
                                            .toList(),
                                      ],
                                      rows: List.generate(
                                        sizeCharts[selectedFit]!.length,
                                            (index) => DataRow(
                                          cells: [
                                            DataCell(Text(_getMeasurementLabel(index))),
                                            ...sizeCharts[selectedFit]![index]
                                                .map((value) => DataCell(Text(value)))
                                                .toList(),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          // Right side: Image directly
                          Padding(
                            padding: const EdgeInsets.only(left: 2.0),
                            child: Container(
                              width: 250, // Adjust width of the image card
                              height: 400, // Adjust height of the image
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12.0),
                                child: Image.asset(
                                  'assets/images/deskstop-main.png',
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),const SizedBox(height: 10),Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  // Fabric Selection Card
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.30,
                    height: 400,// Adjust width as needed
                    child: Card(
                      color: Colors.grey[200],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Choose Fabric',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            // Fabric options with Radio buttons
                            RadioListTile<String>(
                              title: const Text('Jersey, 185GSM, 100% organic cotton'),
                              value: 'Jersey185Organic',
                              groupValue: selectedFabric,
                              onChanged: (String? value) {
                                setState(() {
                                  selectedFabric = value!;
                                });
                              },
                            ),
                            RadioListTile<String>(
                              title: const Text('Jersey, 235GSM, 100% cotton'),
                              value: 'Jersey235Cotton',
                              groupValue: selectedFabric,
                              onChanged: (String? value) {
                                setState(() {
                                  selectedFabric = value!;
                                });
                              },
                            ),
                            RadioListTile<String>(
                              title: const Text('Jersey, 235GSM, 100% organic cotton'),
                              value: 'Jersey235Organic',
                              groupValue: selectedFabric,
                              onChanged: (String? value) {
                                setState(() {
                                  selectedFabric = value!;
                                });
                              },
                            ),
                            RadioListTile<String>(
                              title: const Text('Jersey, 295GSM, 100% cotton'),
                              value: 'Jersey295Cotton',
                              groupValue: selectedFabric,
                              onChanged: (String? value) {
                                setState(() {
                                  selectedFabric = value!;
                                });
                              },
                            ),
                            const SizedBox(height: 10),
                            RadioListTile<String>(
                              title: const Text('Custom'),
                              value: 'Custom',
                              groupValue: selectedFabric,
                              onChanged: (String? value) {
                                setState(() {
                                  selectedFabric = value!;
                                });
                              },
                            ),
                            const SizedBox(height: 10), // Spacer between radio buttons and text field
                            // TextField under the radio buttons
                            TextField(
                              decoration: InputDecoration(
                                labelText: 'Additional Notes',
                                hintText: 'Enter any additional fabric details...',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.55,
                    child: Card(
                      color: Colors.grey[200],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Choose a Color',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 12),
                            // Color selection with Wrap inside Scrollable View
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: colors.map((color) {
                                  final isSelected = selectedColor == color;

                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedColor = color;
                                      });
                                    },
                                    child: Container(
                                      width: 24.0, // Diameter of the circle
                                      height: 24.0, // Same height for circular shape
                                      decoration: BoxDecoration(
                                        color: color,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: isSelected ? Colors.blueAccent : Colors.grey[400]!,
                                          width: isSelected ? 1.5 : 0.75,
                                        ),
                                      ),
                                      child: isSelected
                                          ? const Icon(
                                        Icons.check,
                                        color: Colors.white,
                                        size: 12.0, // Smaller check icon
                                      )
                                          : null,
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                            const SizedBox(height: 20), // Space between colors and options
                            const Text(
                              'Garment Dye Options',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 12),
                            // Garment Dye Options
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RadioListTile(
                                  title: const Text('Garment Dye [ fade-out ]'),
                                  value: 'fade-out',
                                  groupValue: selectedDye,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedDye = value.toString();
                                    });
                                  },
                                ),
                                RadioListTile(
                                  title: const Text('Garment Dye [ reactive ]'),
                                  value: 'reactive',
                                  groupValue: selectedDye,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedDye = value.toString();
                                    });
                                  },
                                ),
                                RadioListTile(
                                  title: const Text('Fabric Dye'),
                                  value: 'fabric-dye',
                                  groupValue: selectedDye,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedDye = value.toString();
                                    });
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(height: 20), // Space between options and the custom text field
                            const Text(
                              'Custom Input',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 12),
                            TextField(
                              decoration: InputDecoration(
                                hintText: 'Enter custom color',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )


                ],



              ),  Align(
          alignment: Alignment.bottomRight, // Align the button at the bottom right
          child: CustomButton(
            buttonText: 'Save & Next',
            icon: Icons.arrow_forward,
            onPressed: () {
              // Navigate to the NextPage
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => t_lable()),
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
  }

  String _getMeasurementLabel(int index) {
    const labels = [
      'Total Length (A)',
      'Chest Width (B)',
      'Bottom Width (C)',
      'Sleeve Length (D)',
      'Armhole (E)',
      'Sleeve Opening (F)',
      'Neck Rib Length (G)',
      'Neck Opening (H)',
      'Shoulder-to-Shoulder (I)',
    ];
    return labels[index];
  }
}
