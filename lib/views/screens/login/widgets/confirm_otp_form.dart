import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/screens/login/bloc/login_bloc.dart';
// import 'package:flutter_application_1/views/screens/login/bloc_login/login_bloc.dart';
// import 'package:flutter_application_1/views/screens/login/bloc_login/login_event.dart';
// import 'package:flutter_application_1/views/screens/login/bloc_login/login_state.dart';
// import 'package:flutter_application_1/views/screens/login/widget_current.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ConfirmOtpForm extends StatefulWidget {
  const ConfirmOtpForm({super.key});

  @override
  State<ConfirmOtpForm> createState() => _ConfirmOtpFormState();
}

class _ConfirmOtpFormState extends State<ConfirmOtpForm> {
  final TextEditingController _otpController = TextEditingController();
  String currentText = '';
  Timer? _timer;
  int _remainingTime = 300;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        setState(() {
          _remainingTime--;
        });
      } else {
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final minutes = (_remainingTime ~/ 60).toString().padLeft(2, '0');
    final seconds = (_remainingTime % 60).toString().padLeft(2, '0');
    return BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {},
        child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
          return Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(alignment: Alignment.center, children: [
                    Container(
                      padding: const EdgeInsets.only(top: 18, bottom: 18),
                      child: const Center(
                          child: Text(
                        'Confirm OTP code',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                    ),
                    Positioned(
                        left: 0,
                        child: IconButton(
                          onPressed: () {
                            context.read<LoginBloc>().add(ShowRegisterEvent());
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.red,
                            size: 20,
                          ),
                        ))
                  ]),
                  Container(
                    padding: const EdgeInsets.all(18),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: [
                        const TextSpan(
                          text:
                              'Please enter the OTP code sent to your phone number ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        TextSpan(
                          text: state.phoneNumber,
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                          ),
                        )
                      ]),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: PinCodeTextField(
                      appContext: context,
                      length: 5,
                      blinkWhenObscuring: true,
                      animationType: AnimationType.fade,
                      pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(15),
                          fieldHeight: 50,
                          fieldWidth: 50,
                          activeFillColor: Colors.white,
                          inactiveColor: Colors.red,
                          activeColor: Colors.red,
                          selectedColor: Colors.red,
                          borderWidth: 1),
                      cursorColor: Colors.black,
                      animationDuration: const Duration(milliseconds: 300),
                      controller: _otpController,
                      keyboardType: TextInputType.number,
                      onCompleted: (v) {
                        debugPrint("Completed");
                      },
                      // onTap: () {
                      //   print("Pressed");
                      // },
                      onChanged: (value) {
                        debugPrint(value);
                        setState(() {
                          currentText = value;
                        });
                      },
                      beforeTextPaste: (text) {
                        debugPrint("Allowing to paste $text");
                        return true;
                      },
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          context.read<LoginBloc>().add(ShowCreatePasswordEvent(
                              phoneNumber: state.phoneNumber));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          minimumSize: const Size(double.infinity, 0),
                        ),
                        child: const Text(
                          'Confirm',
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Resend OTP code in '),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                            minutes == '00' && seconds == '00'
                                ? 'Resend'
                                : '$minutes:$seconds',
                            style: const TextStyle(
                                color: Colors.red,
                                fontSize: 16,
                                fontWeight: FontWeight.w400)),
                      ),
                    ],
                  ),
                ],
              ));
        }));
  }
}
