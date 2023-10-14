import 'package:flutter/material.dart';

class FooterOnboarding extends StatelessWidget {
  const FooterOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      decoration: const BoxDecoration(
        color: Color(0xFFF2F7FB),
      ),
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    'Ostello, the ultimate companion for every student.',
                    style: TextStyle(
                      fontSize: 30,
                      color: Color(0xffC896FF),
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(height: 20),
                Flexible(
                  child: Text(
                    'Made with ❤️ in India 🇮🇳',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xff7D23E0),
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: -10,
            child: Image.asset(
              'assets/footer-rocket.png',
              width: MediaQuery.of(context).size.width * 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
