import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/user_controller.dart';
import 'package:flutter_application_1/login/login_page.dart';
import 'package:get/get.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Text(userController.currentUser.value!.name),
            Text(userController.currentUser.value!.email),
            Text(userController.currentUser.value!.address),
            Text(userController.currentUser.value!.phoneNumber),
            TextButton(
                onPressed: () => {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()))
                    },
                child: const Text('Logout'))
          ],
        ),
      ),
    );
  }
}
