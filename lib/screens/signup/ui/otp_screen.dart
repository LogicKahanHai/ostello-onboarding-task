import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  final String phone;
  const OtpScreen({super.key, required this.phone});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _otpController = TextEditingController();
  final _otpFocusNode = FocusNode();

  bool isSubmitDisabled = true;

  late Timer _timer;
  int _start = 30;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    _otpFocusNode.addListener(() {
      setState(() {});
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      startTimer();
    });
    super.initState();
  }

  @override
  void dispose() {
    _otpController.dispose();
    _otpFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color(0xff7D23E0), width: 2),
      borderRadius: BorderRadius.circular(10),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Colors.transparent,
        border: Border.all(color: const Color(0xff7D23E0), width: 2),
      ),
    );

    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(
                flex: 1,
                child: SizedBox.shrink(),
              ),
              Column(
                children: [
                  const Text(
                    'Enter One Time Password',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text:
                          'Please enter the 6-digit OTP shared on your mobile number ',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                          ),
                      children: [
                        TextSpan(
                          text:
                              '+91 ${widget.phone.substring(0, 1)}*******${widget.phone.substring(8)}',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Pinput(
                    length: 6,
                    androidSmsAutofillMethod:
                        AndroidSmsAutofillMethod.smsUserConsentApi,
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: focusedPinTheme,
                    submittedPinTheme: submittedPinTheme,
                    controller: _otpController,
                    focusNode: _otpFocusNode,
                    keyboardAppearance: Brightness.light,
                    validator: (pin) {
                      if (pin == null || pin.isEmpty) {
                        return 'Please enter the code';
                      }
                      if (pin.length < 4) {
                        return 'Please enter the complete pin';
                      }
                      return null;
                    },
                    onChanged: (pin) {
                      if (pin.length == 6) {
                        setState(() {
                          isSubmitDisabled = false;
                        });
                      } else {
                        setState(() {
                          isSubmitDisabled = true;
                        });
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  Text(
                    '00:${_start.toString().padLeft(2, '0')}',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xff00D566),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 52,
                    child: ElevatedButton(
                      onPressed: isSubmitDisabled ? null : () {},
                      style: ButtonStyle(
                        backgroundColor: isSubmitDisabled
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
                        'Confirm OTP',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'Didn\'t receive the OTP? ',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.black,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                          ),
                      children: [
                        TextSpan(
                          text: 'Send Again',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: const Color(0xff7D23E0),
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Expanded(
                flex: 2,
                child: SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
