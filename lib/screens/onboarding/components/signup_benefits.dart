import 'package:flutter/material.dart';

class SignupBenefits extends StatelessWidget {
  const SignupBenefits({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'What do you get on signing up?',
            style: TextStyle(
              color: Colors.black,
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              BenefitCard(
                title: 'Coaching Partner App',
                description:
                    'Help students discover your coaching by creating a listing on Ostello',
                number: 1,
              ),
              SizedBox(height: 10),
              BenefitCard(
                title: 'Students Analytics Dashboard',
                description:
                    'Help students discover your coaching by creating a listing on Ostello',
                number: 2,
              ),
              SizedBox(height: 10),
              BenefitCard(
                title: 'API Integration',
                description:
                    'Help students discover your coaching by creating a listing on Ostello',
                number: 3,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class BenefitCard extends StatelessWidget {
  final String title;
  final String description;
  final int number;
  const BenefitCard(
      {super.key,
      required this.title,
      required this.description,
      required this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 0.5,
            offset: Offset(0, 0.5),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: const Color(0xFF7D23E0),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Text(
                number.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 17,
                  ),
                ),
                const SizedBox(height: 5),
                Text(description,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: const TextStyle(
                      color: Colors.black,
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
