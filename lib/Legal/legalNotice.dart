import 'package:flutter/material.dart';

import '../widgets/appBar.dart';
import '../widgets/footer.dart';

class LegalNoticePage extends StatelessWidget {
  const LegalNoticePage({super.key});

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
                    'Legal Notice',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Contact address',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text('VERTIDAS Ventures GmbH\nKirchgasse 15\n7310 Bad Ragaz\nSwitzerland (CH)'),
                  SizedBox(height: 10),
                  Text('E-Mail: info@labwearstudios.com'),
                  SizedBox(height: 20),
                  Text(
                    'Authorised representatives',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text('Nicolas Schierle, Chief Executive Officer'),
                  SizedBox(height: 20),
                  Text(
                    'Entry in the commercial register',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text('Company name\nVERTIDAS Ventures GmbH'),
                  SizedBox(height: 10),
                  Text('Company identification number (UID)\nCHE-207.057.226'),
                  SizedBox(height: 10),
                  Text('Swiss VAT number\nCHE-207.057.226 MWST'),
                  SizedBox(height: 20),
                  Text(
                    'Disclaimer',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'The author assumes no liability whatsoever regarding the correctness, accuracy, up-to-datedness, reliability, and completeness of the information.\n\n'
                        'Liability claims regarding damage caused using any information provided, including any kind of information which is incomplete or incorrect, will therefore be rejected.\n\n'
                        'All offers are non-binding. The author expressly reserves the right to change, supplement or delete parts of the pages or the entire offer without special notice or to discontinue publication temporarily or permanently.',
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Disclaimer for links',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'References and links to third party websites are outside our area of responsibility. We decline all responsibility for such websites. Access and use of such websites is at the risk of the respective user.',
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Copyrights',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'The copyrights and all other rights to the content, images, photos, or other files on this website belong exclusively to VERTIDAS Ventures GmbH or the specially named copyright holders. The written consent of the copyright holder must be obtained in advance for the reproduction of any elements.',
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

