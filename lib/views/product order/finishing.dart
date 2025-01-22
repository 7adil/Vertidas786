import 'package:flutter/material.dart';
import '../../widgets/buttons.dart';
import 'quantity.dart';

class Finishing extends StatefulWidget {
  const Finishing({super.key});

  @override
  State<Finishing> createState() => _FinishingState();
}

class _FinishingState extends State<Finishing> {
  bool isSunfadeChecked = true;
  bool isStitchingChecked = true;
  bool isDistressingChecked = true;

  String? selectedSunfadeOption = 'Shoulder Sunfade (T)';
  String? selectedStitchingOption = 'Standard Stitching (T)';
  String? selectedDistressingOption = 'Heavy Distressing (T)';

  final TextEditingController stitchingColorController = TextEditingController();

  String? _getSunfadeImagePath() {
    switch (selectedSunfadeOption) {
      case 'Shoulder Sunfade (T)':
        return 'assets/images/shoulder sun fade.png';
      case 'Shoulder & Bottom Sunfade (T)':
        return 'assets/images/Shoulder & Bottom Sunfade.png';
      case 'Circular Sunfade (T)':
        return 'assets/images/Circular Sunfade.png';
      case 'All-over Sunfade (T)':
        return 'assets/images/All-over Sunfade.png';
      default:
        return null;
    }
  }

  String? _getStitchingImagePath() {
    switch (selectedStitchingOption) {
      case 'Standard Stitching (T)':
        return 'assets/images/StandardStitching.png';
      case 'Inside-Out Stitching (T)':
        return 'assets/images/Inside-Out Stitching.png';
      case 'Raw Edge Stitching (T)':
        return 'assets/images/Raw Edge Stitching.png';
      case 'Flatlock Stitching (T)':
        return 'assets/images/FlatStitching.png';
      default:
        return null;
    }
  }

  String? _getDistressingImagePath() {
    switch (selectedDistressingOption) {
      case 'Heavy Distressing (T)':
        return 'assets/images/Heavy Distressing.png';
      case 'Light Distressing (T)':
        return 'assets/images/LightDistressing.png';
      default:
        return null;
    }
  }

  Widget _buildCard({
    required String cardTitle,
    required bool isChecked,
    required ValueChanged<bool?> onChecked,
    required List<String>? radioOptions,
    String? selectedOption,
    ValueChanged<String?>? onRadioSelected,
    String? imagePath,
    Widget? additionalContent,
  }) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cardTitle,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            CheckboxListTile(
              title: Text(cardTitle),
              value: isChecked,
              onChanged: onChecked,
              controlAffinity: ListTileControlAffinity.leading,
            ),
            if (imagePath != null)
              Center(
                child: Image.asset(
                  imagePath,
                  width: 300,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
            if (isChecked && radioOptions != null)
              ...radioOptions.map(
                    (option) => RadioListTile<String>(
                  title: Text(option),
                  value: option,
                  groupValue: selectedOption,
                  onChanged: onRadioSelected,
                ),
              ),
            if (isChecked && additionalContent != null) additionalContent,
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600; // Mobile screen threshold

    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Customize your design'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Customize your design',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            if (isMobile)
              Column(
                children: [
                  _buildCard(
                    cardTitle: 'Sunfade',
                    isChecked: isSunfadeChecked,
                    onChecked: (value) {
                      setState(() {
                        isSunfadeChecked = value ?? false;
                      });
                    },
                    radioOptions: [
                      'Shoulder Sunfade (T)',
                      'Shoulder & Bottom Sunfade (T)',
                      'Circular Sunfade (T)',
                      'All-over Sunfade (T)',
                    ],
                    selectedOption: selectedSunfadeOption,
                    onRadioSelected: (value) {
                      setState(() {
                        selectedSunfadeOption = value;
                      });
                    },
                    imagePath: _getSunfadeImagePath(),
                  ),
                  const SizedBox(height: 16),
                  _buildCard(
                    cardTitle: 'Stitching',
                    isChecked: isStitchingChecked,
                    onChecked: (value) {
                      setState(() {
                        isStitchingChecked = value ?? false;
                      });
                    },
                    radioOptions: [
                      'Standard Stitching (T)',
                      'Inside-Out Stitching (T)',
                      'Raw Edge Stitching (T)',
                      'Flatlock Stitching (T)',
                    ],
                    selectedOption: selectedStitchingOption,
                    onRadioSelected: (value) {
                      setState(() {
                        selectedStitchingOption = value;
                      });
                    },
                    imagePath: _getStitchingImagePath(),
                    additionalContent: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: TextField(
                        controller: stitchingColorController,
                        decoration: const InputDecoration(
                          labelText: 'Select Color',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildCard(
                    cardTitle: 'Distressing',
                    isChecked: isDistressingChecked,
                    onChecked: (value) {
                      setState(() {
                        isDistressingChecked = value ?? false;
                      });
                    },
                    radioOptions: [
                      'Heavy Distressing (T)',
                      'Light Distressing (T)',
                    ],
                    selectedOption: selectedDistressingOption,
                    onRadioSelected: (value) {
                      setState(() {
                        selectedDistressingOption = value;
                      });
                    },
                    imagePath: _getDistressingImagePath(),
                  ),
                ],
              )
            else
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: _buildCard(
                      cardTitle: 'Sunfade',
                      isChecked: isSunfadeChecked,
                      onChecked: (value) {
                        setState(() {
                          isSunfadeChecked = value ?? false;
                        });
                      },
                      radioOptions: [
                        'Shoulder Sunfade (T)',
                        'Shoulder & Bottom Sunfade (T)',
                        'Circular Sunfade (T)',
                        'All-over Sunfade (T)',
                      ],
                      selectedOption: selectedSunfadeOption,
                      onRadioSelected: (value) {
                        setState(() {
                          selectedSunfadeOption = value;
                        });
                      },
                      imagePath: _getSunfadeImagePath(),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildCard(
                      cardTitle: 'Stitching',
                      isChecked: isStitchingChecked,
                      onChecked: (value) {
                        setState(() {
                          isStitchingChecked = value ?? false;
                        });
                      },
                      radioOptions: [
                        'Standard Stitching (T)',
                        'Inside-Out Stitching (T)',
                        'Raw Edge Stitching (T)',
                        'Flatlock Stitching (T)',
                      ],
                      selectedOption: selectedStitchingOption,
                      onRadioSelected: (value) {
                        setState(() {
                          selectedStitchingOption = value;
                        });
                      },
                      imagePath: _getStitchingImagePath(),
                      additionalContent: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: TextField(
                          controller: stitchingColorController,
                          decoration: const InputDecoration(
                            labelText: 'Select Color',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildCard(
                      cardTitle: 'Distressing',
                      isChecked: isDistressingChecked,
                      onChecked: (value) {
                        setState(() {
                          isDistressingChecked = value ?? false;
                        });
                      },
                      radioOptions: [
                        'Heavy Distressing (T)',
                        'Light Distressing (T)',
                      ],
                      selectedOption: selectedDistressingOption,
                      onRadioSelected: (value) {
                        setState(() {
                          selectedDistressingOption = value;
                        });
                      },
                      imagePath: _getDistressingImagePath(),
                    ),
                  ),
                ],
              ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.bottomRight,
              child: CustomButton(
                buttonText: 'Save & Next',
                icon: Icons.arrow_forward,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const QA()),
                  );
                },
                color: Colors.blue,
                textColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }}
