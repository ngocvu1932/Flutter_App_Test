import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/screens/login/bloc/login_bloc.dart';
// import 'package:flutter_application_1/views/screens/login/bloc_login/login_bloc.dart';
// import 'package:flutter_application_1/views/screens/login/bloc_login/login_event.dart';
// import 'package:flutter_application_1/views/screens/login/bloc_login/login_state.dart';
// import 'package:flutter_application_1/views/screens/login/widget_current.dart';
import 'package:flutter_application_1/views/widgets/textinput/text_input.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterForm extends StatefulWidget {
  // final void Function(WidgetCurrent) state;
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {},
      child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
        return Container(
            margin: const EdgeInsets.only(top: 18),
            padding: const EdgeInsets.only(left: 10, right: 10),
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    const Center(
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      child: IconButton(
                        onPressed: () {
                          context.read<LoginBloc>().add(ShowLoginEvent());
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.red,
                          size: 20,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                TextInput(
                    controllers: _phoneNumberController,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: GestureDetector(
                        onTap: () {
                          print('Country code');
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: Image.asset(
                                'assets/images/flag_vn.png',
                                width: 35,
                                height: 25,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 5),
                            const Text('+84',
                                style: TextStyle(color: Colors.red)),
                          ],
                        ),
                      ),
                    ),
                    labelText: 'Enter your phone number'),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        context.read<LoginBloc>().add(ShowConfirmOtpEvent(
                              phoneNumber: _phoneNumberController.text.trim(),
                            ));
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
                        'Get OTP code',
                        style: TextStyle(color: Colors.white),
                      )),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account?',
                        style: TextStyle(color: Color(0xFF9E9EA8))),
                    TextButton(
                        onPressed: () {
                          context.read<LoginBloc>().add(ShowLoginEvent());
                        },
                        child: const Text('Sign In',
                            style: TextStyle(
                                color: Colors.red,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.red)))
                  ],
                )
              ],
            ));
      }),
    );
  }
}
