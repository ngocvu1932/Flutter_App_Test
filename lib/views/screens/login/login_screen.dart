import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/screens/login/bloc/login_bloc.dart';
import 'package:flutter_application_1/views/screens/login/widgets/confirm_otp_form.dart';
import 'package:flutter_application_1/views/screens/login/widgets/create_password_form.dart';
import 'package:flutter_application_1/views/screens/login/widgets/login_form.dart';
import 'package:flutter_application_1/views/screens/login/widgets/register_form.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  bool isShowModalFinger = false;

  void _toggleModalFinger() {
    setState(() {
      isShowModalFinger = !isShowModalFinger;
    });
  }

  Widget _currentWidget(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        if (state is RegisterState) {
          return const RegisterForm();
        } else if (state is ConfirmOtpState) {
          return const ConfirmOtpForm();
        } else if (state is CreatePasswordState) {
          return const CreatePasswordForm();
        } else {
          return LoginForm(onFingerprintPressed: _toggleModalFinger);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return MaterialApp(
        home: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                'assets/images/Surface.png',
                width: MediaQuery.of(context).size.width,
              ),
              const Positioned(
                bottom: 20,
                child: Text(
                  'Sabeco B2B version 1.9',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
        Center(
          child: BlocProvider(
            create: (context) => LoginBloc(),
            child: Container(
                // height: screenHeight * 0.45,
                padding: const EdgeInsets.all(12.0),
                margin: EdgeInsets.only(
                    left: 12.0, right: 12.0, top: screenHeight * 0.1),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: _currentWidget(context)),
          ),
        ),
        isShowModalFinger
            ? GestureDetector(
                onTap: () => {
                  setState(() {
                    isShowModalFinger = false;
                  })
                },
                child: Container(
                  color: Colors.black.withOpacity(0.4),
                  child: Center(
                    child: GestureDetector(
                      onTap: () => {},
                      child: Container(
                        width: screenWidth * 0.8,
                        // height: screenHeight * 0.25,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.only(
                                  top: 12, left: 12, bottom: 12),
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFFD92332),
                                    Color(0xFFE14F5B)
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12)),
                              ),
                              child: const Text(
                                'Notice',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            const SizedBox(height: 12),
                            Container(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: const Text(
                                'Do you want to set unlock by fingerprint, faceID?',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () => {_toggleModalFinger()},
                                    child: Container(
                                      margin: const EdgeInsets.all(8),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                            width: 1, color: Colors.red),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: const Center(
                                        child: Text('No',
                                            style:
                                                TextStyle(color: Colors.red)),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () => {},
                                    child: Container(
                                      margin: const EdgeInsets.all(8),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: const Center(
                                        child: Text('Yes',
                                            style:
                                                TextStyle(color: Colors.white)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            : Container(),
      ]),
    ));
  }
}
