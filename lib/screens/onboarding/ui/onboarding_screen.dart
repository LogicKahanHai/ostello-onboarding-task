import 'package:flutter/material.dart';
import 'package:ostello_onboarding_task/screens/onboarding/components/backdrop_intro.dart';
import 'package:ostello_onboarding_task/screens/onboarding/components/check_list.dart';
import 'package:ostello_onboarding_task/screens/onboarding/components/faq.dart';
import 'package:ostello_onboarding_task/screens/onboarding/components/footer.dart';
import 'package:ostello_onboarding_task/screens/onboarding/components/get_started.dart';
import 'package:ostello_onboarding_task/screens/onboarding/components/reasons_ostello.dart';
import 'package:ostello_onboarding_task/screens/onboarding/components/reviews.dart';
import 'package:ostello_onboarding_task/screens/onboarding/components/signup_benefits.dart';
import 'package:ostello_onboarding_task/screens/onboarding/components/step_guide.dart';
import 'package:ostello_onboarding_task/screens/signup/ui/signup_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void navigateToSignupScreen() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SignupScreen(),
        ),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BackdropIntroOnboarding(
              onLogin: navigateToSignupScreen,
            ),
            const SizedBox(height: 20),
            const CheckListOnboarding(),
            const SizedBox(height: 20),
            const ReasonsOstelloOnboarding(),
            const SizedBox(height: 20),
            const StepGuideOnboarding(),
            const SizedBox(height: 20),
            const SignupBenefits(),
            const SizedBox(height: 20),
            const ReviewsOnboarding(),
            const SizedBox(height: 20),
            GetStartedOnboarding(
              onLogin: navigateToSignupScreen,
            ),
            const SizedBox(height: 20),
            const FAQsOnboarding(),
            const SizedBox(height: 20),
            const FooterOnboarding(),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
              color: const Color(0xffDBEFFF),
              child: Center(
                child: Text(
                  'version 2.0',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
