import 'package:flutter/material.dart';

import '../widgets/appBar.dart';
import '../widgets/footer.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header


            // Page Content
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Privacy Policy',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'INTRODUCTION',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'LABWEAR VENTURES GMBH aims to give you the best experience and in doing so is very committed to your privacy and keeping your personal data safe.\n\n'
                        'This privacy statement (“Privacy Statement”) is issued on behalf of LABWEAR VENTURES GMBH, also referred to as "LABWEAR", "we", "us" or "our" in this Privacy Statement. This Privacy Statement aims to inform you of our practices with respect to the collection and use of your personal information. our dedication to protecting it and your rights and options to control your personal data and protect your privacy.',
                  ),
                  SizedBox(height: 10),
                  Text(
                    'We are bound by the General Data Protection Regulation (“GDPR”) and will protect your personal information in accordance with the principles set out therein.',
                  ),
                  SizedBox(height: 20),
                  Text(
                    'WHEN DOES THIS PRIVACY STATEMENT APPLY?',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'This Privacy Statement applies to all personal information collected through and/or processed in connection with www.labwearstudios.com (the “Website”), app.labwearstudios.com (the “VERTIDAS”), the services offered by LABWEAR and verbal, email, text and other electronic messages between you, our Website, VERTIDAS, and/or LABWEAR personnel.\n\n'
                        'This Privacy Statement does not address the processing of personal data of employees and/or interns in the context of their employment or internship relationship with LABWEAR.',
                  ),
                  SizedBox(height: 20),
                  Text(
                    'WHAT IS PERSONAL DATA AND WHAT DOES PROCESSING MEAN?',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'At LABWEAR, we consider all information that relates to you and identifies you personally, either alone or in combination with other personal information available to us as personal data. Processing of personal data is pretty much anything you can do with personal data. For example: gathering, storing, combining, transferring, or deleting data.',
                  ),
                  SizedBox(height: 20),
                  Text(
                    'HOW DO WE COLLECT PERSONAL DATA?',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'We collect your personal data through a variety of sources:\n\n'
                        'Directly from you, such as the information you provide to us (directly or indirectly through third party services) when you submit a form for a newsletter, access to our VERTIDAS, when you place an order through our webshop, when you opt-in for our mailings, when you apply for job opening, when you access our white papers, when you, in using our services, exchange private messages (including, but not limited to text, verbal, images, videos, locations, contact details) with us or when you give us your (digital) business card;\n\n'
                        'From others, such as your business partners, your colleague, through a mutual connection / our network and through social media channels such as Instagram (Meta);\n\n'
                        'From sources that are publicly available such as LinkedIn, your company’s website and trade fairs;\n\n'
                        'By means of cookies.',
                  ),
                  SizedBox(height: 20),
                  Text(
                    'WHAT DO WE COLLECT',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Personal Identifiers\n\n'
                        'When you use our services through our Website and/or VERTIDAS, we may collect your‎ first and last name, title, profession, company name, company profile, postal address, email address, phone number, username, password, social media accounts, billing information, shipping information, tax registration status and number, and/or demographic information (such as your gender, age and/or occupation).\n\n'
                        'Payment details\n\n'
                        'If you are ordering through our webshop, we may collect payment data, including but not limited to name, account number, credit card numbers, bank addresses, and payment method preferences.\n\n'
                        'Personal account or registration details\n\n'
                        'When you create a personal account on VERTIDAS, register for an event or make purchases in our webshop, we may record your sign-in details, name, and other information you fill out on your personal account or registration form or information we gather from your device.',
                  ),
                  SizedBox(height: 20),
                  Text(
                    'HOW WE USE YOUR PERSONAL INFORMATION',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'We may use your personal information as follows:\n\n'
                        'to provide our services to you;\n'
                        'to facilitate any communication required for delivery of our services, including sharing your personal information as necessary to fulfil your order;\n'
                        'to operate, maintain, and improve our Website, products, and services;\n'
                        'to respond to comments and questions and provide customer service;\n'
                        'to send information including confirmations, invoices, technical notices, updates, security alerts and support and administrative messages;\n'
                        'to communicate about promotions, upcoming events, and other news about products and services offered by us and/or our selected partners;\n'
                        'To facilitate payments for services and/or products you ordered from us;\n'
                        'to link or combine user information with other personal information;\n'
                        'to allow you to participate in interactive features on our Website and/or VERTIDAS;\n'
                        'to notify you about changes to our Website and/or VERTIDAS or any products or services we offer or provide though it;\n'
                        'to deliver ads based on your interests, including content you have viewed and pages you have visited;\n'
                        'to inform marketing analytics;\n'
                        'in any other way we may describe when you provide the information; and/or\n'
                        'for any other purpose with your consent.',
                  ),
                  SizedBox(height: 20),
                  Text(
                    'WHO HAS ACCESS TO YOUR PERSONAL DATA?',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'We may share your personal information with the following:\n\n'
                        'our subsidiaries, affiliates and any ultimate parent company;\n\n'
                        'LABWEAR employees to the extent necessary to serve the applicable purpose and to perform their jobs.\n\n'
                        'our contractors, service providers and other third parties that we use to support our business and who are bound by contractual obligations to keep personal information confidential and use it only for the purposes for which we disclose it to them;\n\n'
                        'a buyer or other successor in the event of a merger, divestiture, restructuring, reorganization, dissolution or other sale or transfer of some or all of LABWEAR’s assets, or negotiation of such a business deal, whether as a going concern or as part of bankruptcy, liquidation, or similar proceeding, in which personal information held by LABWEAR is among the assets transferred.\n\n'
                        'We may share your personal information with your consent. For example, you may let us share personal information with third-parties for their own marketing uses. Those uses will be subject to the privacy policies of those third-parties. We may also share aggregated and/or anonymized data with others for their own uses.',
                  ),
                  SizedBox(height: 20),
                  Text(
                    'HOW LONG WE KEEP YOUR PERSONAL INFORMATION',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Your personal data will be retained for as long as required for the purposes described in this Privacy Statement or in so far as such is necessary for compliance with statutory obligations and for solving any disputes. When we process your personal information based on your consent, we will store your personal information no longer than is necessary, or until you revoke your consent.',
                  ),
                ],
              ),
            ),

            // Footer
            Footer(context, footerText: ''),
          ],
        ),
      ),
    );
  }
}

// Assuming you have these methods implemented in separate header.dart and footer.dart files
