import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/screens/login/login_screen.dart';
import 'package:flutter_application_1/views/screens/login/user.dart';

class DashboardPage extends StatefulWidget {
  final User user;

  const DashboardPage({super.key, required this.user});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
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
            Text(widget.user.name),
            Text(widget.user.email),
            Text(widget.user.address),
            Text(widget.user.phoneNumber),
            TextButton(
                onPressed: () => {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()))
                    },
                child: const Text('Logout'))
          ],
        ),
      ),
    );
  }
}
