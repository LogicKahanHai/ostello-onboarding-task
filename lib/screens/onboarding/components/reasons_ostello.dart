import 'package:flutter/material.dart';

class ReasonsOstelloOnboarding extends StatelessWidget {
  const ReasonsOstelloOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      color: const Color(0xFFF2F7FB),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Why should you list your coaching with Ostello?',
            style: TextStyle(
              color: Colors.black,
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Text(
            'Ostello empowers you to increase your visibility and attract 60% more students who are in close proximity to your coaching centres. This helps boost your brand visibility and grow your business!',
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ReasonNumbers(
                text: 'monthly enquiries',
                number: 500,
                icon: Icon(
                  Icons.question_answer,
                  color: Color(0xFF7D23E0),
                ),
              ),
              SizedBox(height: 20),
              ReasonNumbers(
                text: 'demo classes',
                number: 1000,
                icon: Icon(
                  Icons.flight_class,
                  color: Color(0xFF7D23E0),
                ),
              ),
              SizedBox(height: 20),
              ReasonNumbers(
                text: 'monthly enquiries',
                number: 5000,
                icon: Icon(
                  Icons.question_mark_sharp,
                  color: Color(0xFF7D23E0),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ReasonNumbers extends StatefulWidget {
  final String text;
  final int number;
  final Icon icon;
  const ReasonNumbers({
    super.key,
    required this.text,
    required this.number,
    required this.icon,
  });

  @override
  State<ReasonNumbers> createState() => _ReasonNumbersState();
}

class _ReasonNumbersState extends State<ReasonNumbers> {
  int showNumber = 0;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      for (int i = 0; i <= widget.number; i++) {
        await Future.delayed(const Duration(milliseconds: 1));
        setState(() {
          showNumber = i;
        });
        if (i > 1000) {
          i += 500;
        }
        // if (i > 500) {
        //   i += 250;
        // }
        // if (i > 100) {
        //   i += 50;
        // }
        // if (i > 50) {
        //   i += 25;
        // }
      }
      setState(() {
        showNumber = widget.number;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                widget.icon,
                const SizedBox(width: 10),
                Text(
                  '$showNumber+',
                  style: const TextStyle(
                    fontSize: 27,
                    color: Color(0xFF7D23E0),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              widget.text,
              style: const TextStyle(
                fontSize: 19,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
