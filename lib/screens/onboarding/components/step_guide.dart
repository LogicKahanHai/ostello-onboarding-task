import 'package:flutter/material.dart';

class StepGuideOnboarding extends StatelessWidget {
  const StepGuideOnboarding({super.key});

  final gridDelegate = const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    childAspectRatio: 0.75,
    crossAxisSpacing: 10,
    mainAxisSpacing: 10,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'How it really works?',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          GridView(
            gridDelegate: gridDelegate,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              StepCard(
                step: 1,
                title: 'Create your Detailed Page on Ostello',
                icon: Icon(
                  Icons.description_outlined,
                  color: Color(0xFF7D23E0),
                ),
                description:
                    'Help students discover your coaching by creating a listing on Ostello',
              ),
              StepCard(
                step: 2,
                title: 'Customize your Coaching Profile',
                icon: Icon(
                  Icons.person,
                  color: Color(0xFF7D23E0),
                ),
                description:
                    'Help students discover your coaching by creating a listing on Ostello',
              ),
              StepCard(
                step: 3,
                title: 'List all your Courses',
                icon: Icon(
                  Icons.checklist,
                  color: Color(0xFF7D23E0),
                ),
                description:
                    'Help students discover your coaching by creating a listing on Ostello',
              ),
              StepCard(
                step: 4,
                title: 'Start Selling on Ostello',
                icon: Icon(
                  Icons.sell,
                  color: Color(0xFF7D23E0),
                ),
                description:
                    'Help students discover your coaching by creating a listing on Ostello',
              ),
            ],
          )
        ],
      ),
    );
  }
}

class StepCard extends StatelessWidget {
  final int step;
  final String title;
  final Icon icon;
  final String description;
  const StepCard({
    super.key,
    required this.step,
    required this.title,
    required this.icon,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 1.5,
            offset: const Offset(0, 1.5),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFFAF5FF),
              borderRadius: BorderRadius.circular(50),
            ),
            child: icon,
          ),
          Text(
            'STEP $step',
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 5),
          Text(
            description,
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
