import 'package:flutter/material.dart';

class FAQsOnboarding extends StatelessWidget {
  const FAQsOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Column(
        children: [
          Text(
            'Frequently Asked Questions',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          QuestionCard(
            question:
                'How much will Ostello charge me for creating a page on it’s platform',
          ),
          QuestionCard(
            question: 'What is NEET exam pass mark?',
          ),
          QuestionCard(
            question: 'What are the subjects in NEET?',
          ),
          QuestionCard(
            question: 'Is +2 compulsory for NEET?',
          ),
          QuestionCard(
            question: 'Is 12 marks important for NEET?',
          ),
        ],
      ),
    );
  }
}

class QuestionCard extends StatelessWidget {
  final String question;
  const QuestionCard({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
      ),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              question,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: const Color(0xff7329D8),
              borderRadius: BorderRadius.circular(50),
            ),
            child: const Icon(
              Icons.keyboard_arrow_down,
              color: Colors.white,
              size: 22,
            ),
          ),
        ],
      ),
    );
  }
}
