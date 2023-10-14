import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:ostello_onboarding_task/screens/signup/ui/otp_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _phoneFocusNode = FocusNode();
  bool isOtpDisabled = true;
  bool isError = false;
  bool isButtonPressed = false;

  @override
  void initState() {
    _phoneFocusNode.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _phoneFocusNode.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity, // full width
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(
                flex: 2,
                child: SizedBox.shrink(),
              ),
              Column(
                children: [
                  const Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Form(
                      key: _formKey,
                      child: TextFormField(
                        controller: _phoneController,
                        focusNode: _phoneFocusNode,
                        keyboardType: TextInputType.phone,
                        keyboardAppearance: Brightness.dark,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF7D23E0),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                          errorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                          focusedErrorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF7D23E0),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                          label: const Text('Phone'),
                          labelStyle: TextStyle(
                            color: _phoneFocusNode.hasFocus
                                ? const Color(0xFF7D23E0)
                                : Colors.grey,
                          ),
                          prefixIcon: Container(
                            height: 20.0,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10.0,
                              vertical: 10.0,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Flag.fromCode(
                                  FlagsCode.IN,
                                  height: 20,
                                  width: 30,
                                  borderRadius: 7,
                                ),
                                const SizedBox(width: 5),
                                const Text(
                                  '+91',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                VerticalDivider(
                                  color: Colors.grey.shade600,
                                  thickness: 1.0,
                                  width: 1.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                        onChanged: (value) {
                          isButtonPressed = false;
                          if (isError) {
                            _formKey.currentState!.validate();
                          }
                          if (value.isNotEmpty && isOtpDisabled) {
                            setState(() {
                              isOtpDisabled = false;
                            });
                          }
                          if (value.isEmpty && !isOtpDisabled) {
                            setState(() {
                              isOtpDisabled = true;
                            });
                          }
                          if (value.length == 10) {
                            _phoneFocusNode.unfocus();
                          }
                        },
                        validator: (value) {
                          if (!isButtonPressed) {
                            return null;
                          }
                          isError = true;
                          if (value == null || value.isEmpty) {
                            return 'Please enter a phone number';
                          }
                          if (value.length < 10 ||
                              value.length > 10 ||
                              int.tryParse(value) == null) {
                            return 'Please enter a valid phone number';
                          }
                          isError = false;
                          return null;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 52,
                    child: ElevatedButton(
                      onPressed: isOtpDisabled
                          ? null
                          : () {
                              isButtonPressed = true;
                              if (_formKey.currentState!.validate()) {
                                print('hello');
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return OtpScreen(
                                        phone: _phoneController.text,
                                      );
                                    },
                                  ),
                                );
                              }
                            },
                      style: ButtonStyle(
                        backgroundColor: isOtpDisabled
                            ? MaterialStateProperty.resolveWith(
                                (states) =>
                                    const Color(0xff7D23E0).withOpacity(0.5),
                              )
                            : MaterialStateProperty.resolveWith(
                                (states) => const Color(0xff7D23E0),
                              ),
                        foregroundColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.white,
                        ),
                        shape: MaterialStateProperty.resolveWith(
                          (states) => RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            // side: BorderSide(
                            //   color: isOtpDisabled
                            //       ? Color(0xFF7D23E0).withOpacity(0.5)
                            //       : Color(0xFF7D23E0),
                            //   width: 2.0,
                            // ),
                          ),
                        ),
                      ),
                      child: const Text(
                        'Send One Time Password',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Divider(
                            thickness: 2,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "OR",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Divider(
                            thickness: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 52,
                    child: ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Coming Soon!'),
                              duration: Duration(seconds: 1),
                            ),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.transparent,
                          ),
                          shadowColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.transparent,
                          ),
                          shape: MaterialStateProperty.resolveWith(
                            (states) => RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: const BorderSide(
                                color: Colors.grey,
                                width: 2.0,
                              ),
                            ),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.email, color: Color(0xff7D23E0)),
                            SizedBox(width: 10),
                            Text(
                              'Continue with Email',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 52,
                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Coming Soon!'),
                            duration: Duration(seconds: 1),
                          ),
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.transparent,
                        ),
                        shadowColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.transparent,
                        ),
                        shape: MaterialStateProperty.resolveWith(
                          (states) => RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            side: const BorderSide(
                              color: Colors.grey,
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/google-icon.png',
                            height: 20,
                            width: 20,
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            'Continue with Google',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: 'Already have an account? ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                        TextSpan(
                          text: 'Login',
                          style: TextStyle(
                              color: Colors.purple,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const Expanded(
                flex: 3,
                child: SizedBox.shrink(),
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'By continuing, you agree to our',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Terms of service',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        Text(
                          'Privacy Policy',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        Text(
                          'Code of Conduct',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
