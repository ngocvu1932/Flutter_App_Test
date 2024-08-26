import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/screens/dashboard/dashboard_page.dart';
import 'package:flutter_application_1/views/screens/login/bloc/login_bloc.dart';
import 'package:flutter_application_1/views/widgets/textinput/text_input.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  final VoidCallback onFingerprintPressed;
  const LoginForm({super.key, required this.onFingerprintPressed});

  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = true;
  bool _isRemember = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.isError == true) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Center(
              child: Text(state.messageState,
                  style: const TextStyle(color: Colors.red)),
            )));
        }

        if (state.isValidLogin == true) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Center(
              child: Text(state.messageState,
                  style: const TextStyle(color: Colors.green)),
            )));
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => DashboardPage(user: state.user),
            ),
          );
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    const SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: Center(
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        right: 0,
                        child: InkWell(
                          onTap: () => {
                            widget.onFingerprintPressed(),
                          },
                          child: Container(
                            width: 45,
                            height: 45,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.fingerprint,
                                size: 30, color: Colors.white),
                          ),
                        )),
                  ],
                ),
                Container(
                    margin: const EdgeInsets.only(top: 16.0),
                    child: Column(
                      children: [
                        // phone number
                        TextInput(
                            labelText: 'Enter your name password',
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
                            controllers: _phoneNumberController),
                        const SizedBox(height: 16),
                        TextInput(
                          labelText: 'Password',
                          controllers: _passwordController,
                          obscureText: _isPasswordVisible,
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(_isPasswordVisible
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () => {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              })
                            },
                          ),
                        ),
                      ],
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: _isRemember,
                      onChanged: (bool? value) {
                        setState(() {
                          _isRemember = value ?? false;
                        });
                      },
                      activeColor: Colors.red,
                    ),
                    TextButton(
                      onPressed: () => {
                        setState(() {
                          _isRemember = !_isRemember;
                        })
                      },
                      child: const Text('Remember me',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w400)),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => {print('Quên mật khẩu')},
                      child: const Text('Forgot password?',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.red,
                              fontWeight: FontWeight.w400)),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 1.0),
                  child: ElevatedButton(
                    onPressed: state.isLoading == true
                        ? null
                        : () {
                            final account = _phoneNumberController.text.trim();
                            final password = _passwordController.text.trim();

                            context.read<LoginBloc>().add(
                                  LoginButtonPressed(
                                      phoneNumber: account, password: password),
                                );
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      minimumSize: const Size(double.infinity, 0),
                    ),
                    child: state.isLoading == true
                        ? const CircularProgressIndicator(
                            color: Colors.white, strokeWidth: 4)
                        : const Text('Sign In',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w400)),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Do not have an account?'),
                    TextButton(
                        onPressed: () {
                          context.read<LoginBloc>().add(ShowRegisterEvent());
                        },
                        child: const Text('Sign Up',
                            style: TextStyle(
                                color: Colors.red,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.red)))
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
