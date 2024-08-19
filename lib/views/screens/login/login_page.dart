import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/user_controller.dart';
import 'package:flutter_application_1/views/screens/dashboard/dashboard_page.dart';
import 'package:flutter_application_1/views/screens/login/components/text_input.dart';
import 'package:flutter_application_1/views/screens/login/data.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final UserController userController = Get.put(UserController());
  final TextEditingController _accountController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isRemember = false;
  final bool _isPasswordVisible = false;

  void _handleLogin(BuildContext context) {
    final String account = _accountController.text;
    final String password = _passwordController.text;
    bool isAuth = false;

    for (var user in mockData) {
      if (user.phoneNumber == account && user.password == password) {
        isAuth = true;
        userController.setUser(user);
        break;
      }
    }

    if (isAuth) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const DashboardPage()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Center(
          child: Text('Sai số điện thoại hoặc mật khẩu',
              style: TextStyle(color: Colors.red)),
        )),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/bg.png'),
                      fit: BoxFit.fill)),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset('assets/images/Surface.png',
                      width: MediaQuery.of(context).size.width),
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
              child: Container(
                padding: const EdgeInsets.all(12.0),
                margin: EdgeInsets.only(
                    left: 12.0, right: 12.0, top: screenHeight * 0.15),
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
                            TextFormField(
                              controller: _accountController,
                              decoration: InputDecoration(
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
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          child: Image.asset(
                                            'assets/images/flag_vn.png',
                                            width: 35,
                                            height: 25,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        const Text('+84',
                                            style:
                                                TextStyle(color: Colors.red)),
                                      ],
                                    ),
                                  ),
                                ),
                                labelText: 'Enter your phone number',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            TextInput(
                                password: 'Password',
                                passwordController: _passwordController,
                                isPasswordVisible: _isPasswordVisible),
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
                        onPressed: () => {_handleLogin(context)},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          minimumSize: const Size(double.infinity, 0),
                        ),
                        child: const Text('Sign In',
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
              ),
            ),
          ],
        ));
  }
}
