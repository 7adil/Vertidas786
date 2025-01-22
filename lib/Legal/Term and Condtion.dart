import 'package:flutter/material.dart';

import '../widgets/appBar.dart';
import '../widgets/footer.dart';

// Define the Footer widget here or import it if it's in a separate file

class TermsAndConditionsPage extends StatelessWidget {
  const TermsAndConditionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CustomAppBar(),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Terms and Conditions',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Welcome to VERTIDAS. Please read these terms and conditions carefully before using our services.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  Text(
                    '1. Introduction',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'These Terms and Conditions govern your use of our website and services. By accessing our website, you agree to comply with these terms.',
                    style: TextStyle(fontSize: 16),
                  ),
                  // Add more sections as needed
                ],
              ),
            ),
          ),
          Footer(
            context,
            footerText: '© 2024 VERTIDAS. All rights reserved.',
          ),
        ],
      ),
    );
  }
}
