import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget Footer(BuildContext context, {required String footerText}) {
  return Container(
    color: Colors.grey[200],
    padding: const EdgeInsets.all(20.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Legal',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _buildFooterLink(context, 'Legal Notice', '/LegalNoticePage'),
                  _buildFooterLink(context, 'Privacy Policy', '/PrivacyPolicy'),
                  _buildFooterLink(context, 'Terms & Conditions', '/termsConditions'),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Information Downloads',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _buildFooterLink(context, 'Product Guide', '/productGuide'),
                  _buildFooterLink(context, 'User Manual', '/userManual'),
                  _buildFooterLink(context, 'LabwearOS Brochure', '/labwearOsBrochure'),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Contact',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _buildFooterLink(context, 'Support', '/support'),
                  _buildFooterLink(context, 'Sales', '/sales'),
                  _buildFooterLink(context, 'General Inquiries', '/generalInquiries'),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Follow Us',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      _buildSocialIcon(context, FontAwesomeIcons.instagram, '/socialMedia'),
                      const SizedBox(width: 10),
                      _buildSocialIcon(context, FontAwesomeIcons.facebook, '/socialMedia'),
                      const SizedBox(width: 10),
                      _buildSocialIcon(context, FontAwesomeIcons.whatsapp, '/socialMedia'),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
        // Add the footer text at the bottom
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Text(
            footerText,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _buildFooterLink(BuildContext context, String title, String route) {
  return TextButton(
    onPressed: () {
      Navigator.pushNamed(context, route);
    },
    child: Text(
      title,
      style: const TextStyle(color: Colors.blue),
    ),
  );
}

Widget _buildSocialIcon(BuildContext context, IconData icon, String route) {
  return IconButton(
    onPressed: () {
      Navigator.pushNamed(context, route);
    },
    icon: Icon(
      icon,
      color: Colors.black,
    ),
  );
}
