import 'package:flutter/material.dart';

class CheckListOnboarding extends StatelessWidget {
  const CheckListOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      color: const Color(0xFFF2F7FB),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Get your institute onboarded in less than 10 minutes!',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          const Text(
            'Keep the documents handy for a smooth onboarding',
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
            textAlign: TextAlign.center,
          ),
          ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              CheckListTile(title: 'Commercial Address Proof'),
              SizedBox(height: 10),
              CheckListTile(title: 'PAN Card'),
              SizedBox(height: 10),
              CheckListTile(title: 'Identity Proof'),
              SizedBox(height: 10),
              CheckListTile(title: 'Trade License'),
              SizedBox(height: 10),
              CheckListTile(title: 'Your coaching Offerings'),
              SizedBox(height: 10),
              CheckListTile(title: 'Bank account details'),
              SizedBox(height: 10),
              CheckListTile(title: 'Coaching institute 3 images'),
            ],
          )
        ],
      ),
    );
  }
}

class CheckListTile extends StatelessWidget {
  final String title;
  const CheckListTile({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.check_circle,
          color: Color(0xFF00D566),
          size: 40,
        ),
        const SizedBox(width: 10),
        Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
