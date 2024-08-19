import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/screens/dashboard/dashboard_page.dart';
import 'package:flutter_application_1/views/widgets/textinput/text_input.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_bloc.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _accountController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = true;
  bool _isRemember = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(state.error,
                    style: const TextStyle(color: Colors.red))),
          );
        } else if (state is LoginSuccess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => DashboardPage(user: state.user)),
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
                          onTap: () => {print('Close')},
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
                            controllers: _accountController),
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
                    onPressed: () {
                      final account = _accountController.text.trim();
                      final password = _passwordController.text.trim();

                      // Gửi event khi bấm đăng nhập
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
                    child: state is LoginLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text('Sign In',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w400)),
                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Do not have an account?'),
                    TextButton(
                        onPressed: null,
                        child: Text('Sign Up',
                            style: TextStyle(
                                color: Colors.red,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.red)))
                  ],
                )
              ],
            ),
          );
          // Column(
          //   children: [
          //     TextFormField(
          //       controller: _accountController,
          //       decoration: InputDecoration(
          //         labelText: 'Enter your phone number',
          //         border: OutlineInputBorder(
          //             borderRadius: BorderRadius.circular(12)),
          //       ),
          //     ),
          //     const SizedBox(height: 16),
          //     TextFormField(
          //       controller: _passwordController,
          //       decoration: InputDecoration(
          //         labelText: 'Enter your password',
          //         border: OutlineInputBorder(
          //             borderRadius: BorderRadius.circular(12)),
          //       ),
          //       obscureText: true,
          //     ),
          //     const SizedBox(height: 16),
          //     ElevatedButton(
          //       onPressed: () {
          //         context.read<LoginBloc>().add(
          //               LoginButtonPressed(
          //                 username: _accountController.text,
          //                 password: _passwordController.text,
          //                 userController: userController,
          //               ),
          //             );
          //       },
          //       child: const Text('Sign In'),
          //     ),
          //     if (state is LoginLoading) const CircularProgressIndicator(),
          //   ],
          // );
        },
      ),
    );
  }
}
