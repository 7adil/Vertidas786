import 'package:flutter/material.dart';
import '../widgets/appBar.dart';
import '../widgets/footer.dart';

class FAQPage extends StatelessWidget {
  final List<Map<String, String>> faqs = [
    {
      'question': 'Where are you based?',
      'answer': 'Our HQ is based in Switzerland, our production is located in Braga, Portugal, and our blanks are shipped from a Portuguese fulfilment centre. ',
    },
    {
      'question': 'When was Vertidas founded?',
      'answer': 'Vertidas was founded in 2021.',
    },
    {
      'question': 'Who founded Vertidas Fashion?',
      'answer': 'CEO & co-founder, Hasnan Nazir; CPO & co-founder, Mirza ADil; and CMO & co-founder Ahad Shah. ',
    },
    {
      'question': 'How many factories do you work with?',
      'answer': 'At the moment, we have a total of 16 factories. This includes CMT factories and sub-suppliers.',
    },
    {
      'question': 'Do you own the factories you work with?',
      'answer': 'No, we do not own the factories we work with.',
    },
    {
      'question': 'Are your factories fostering ethical working conditions?',
      'answer': 'Yes, our factories ensure ethical working conditions.',
    },
    {
      'question': 'From where do you source your cotton?',
      'answer': 'Our cotton is carefully sourced from Brazil, Turkey, Pakistan, or India.',
    },
    {
      'question': 'What is the mission of Vertidas Studios?',
      'answer': 'At Vertidas Studios, we’re reshaping the future of fashion by disrupting the conventional way of manufacturing garments and driving innovation over mass production. Our top-tier technology, Vertidas, empowers brands, towards a more agile and efficient supply chain. ',
    },
    {
      'question': 'Do your factories produce for any known brands?',
      'answer': 'Yes, our factories also produce for well-known brands such as Balenciaga, Acne Studios, Ganni, and Off-White.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16.0),
              itemCount: faqs.length,
              itemBuilder: (context, index) {
                return FAQTile(
                  question: faqs[index]['question']!,
                  answer: faqs[index]['answer']!,
                );
              },
            ),
          ),
          Footer(context, footerText: ''), // Provide the required argument here
        ],
      ),
    );
  }
}

class FAQTile extends StatelessWidget {
  final String question;
  final String answer;

  FAQTile({required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        question,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(answer),
        ),
      ],
    );
  }
}
