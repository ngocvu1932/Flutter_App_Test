import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/screens/login/bloc/login_bloc.dart';
import 'package:flutter_application_1/views/widgets/textinput/text_input.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreatePasswordForm extends StatefulWidget {
  // final void Function(WidgetCurrent) state;
  const CreatePasswordForm({super.key});

  @override
  State<CreatePasswordForm> createState() => _CreatePasswordFormState();
}

class _CreatePasswordFormState extends State<CreatePasswordForm> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _prePasswordController = TextEditingController();
  var _isShowPassword = false;

  @override
  Widget build(BuildContext context) {
    print(_isShowPassword);
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {},
      child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 18, bottom: 18),
                  child: const Center(
                    child: Text(
                      'Create Password',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  child: IconButton(
                      onPressed: () {
                        context.read<LoginBloc>().add(const ShowConfirmOtpEvent(
                            phoneNumber: '0333456543'));
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.red,
                        size: 20,
                      )),
                )
              ],
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              child: TextInput(
                  controllers: _passwordController,
                  prefixIcon: const Icon(Icons.lock_open),
                  obscureText: !_isShowPassword,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isShowPassword = !_isShowPassword;
                      });
                    },
                    icon: _isShowPassword
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                  ),
                  labelText: 'Enter your password'),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextInput(
                  controllers: _prePasswordController,
                  prefixIcon: const Icon(Icons.lock_open),
                  obscureText: !_isShowPassword,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isShowPassword = !_isShowPassword;
                      });
                    },
                    icon: _isShowPassword
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                  ),
                  labelText: 'Re-enter your password'),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(left: 10),
              child: RichText(
                  textAlign: TextAlign.left,
                  text: const TextSpan(children: [
                    TextSpan(
                      text: 'Password must contain: \n',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    WidgetSpan(
                      child: Center(
                        child: Row(
                          children: [
                            Icon(
                              Icons.circle,
                              color: Colors.black,
                              size: 10,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'At least one digit [0-9]',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xff9E9EA8),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    WidgetSpan(
                      child: Center(
                        child: Row(
                          children: [
                            Icon(
                              Icons.circle,
                              color: Colors.black,
                              size: 10,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'At least one lowercase letter [a-z]',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xff9E9EA8),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    WidgetSpan(
                      child: Center(
                        child: Row(
                          children: [
                            Icon(
                              Icons.circle,
                              color: Colors.black,
                              size: 10,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'Length between 6 and 16 characters',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xff9E9EA8),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ])),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    minimumSize: const Size(double.infinity, 0),
                  ),
                  onPressed: () {
                    if (state is CreatePasswordState) {
                      context.read<LoginBloc>().add(CreatePasswordPressed(
                          phoneNumber: state.phoneNumber,
                          password: _passwordController.text.trim(),
                          passwordConfirm: _prePasswordController.text.trim()));
                    }
                  },
                  child: const Text(
                    'Create Password',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  )),
            ),
          ],
        );
      }),
    );
  }
}
