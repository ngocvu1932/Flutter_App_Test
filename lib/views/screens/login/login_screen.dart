import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/screens/login/bloc_login/login_bloc.dart';
import 'package:flutter_application_1/views/screens/login/bloc_login/login_form.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // Background image
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
                child: const LoginForm(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
