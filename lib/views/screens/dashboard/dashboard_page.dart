import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/screens/login/bloc/login_bloc.dart';
import 'package:flutter_application_1/views/screens/login/login_screen.dart';
import 'package:flutter_application_1/views/screens/login/models/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardPage extends StatefulWidget {
  final User user;

  const DashboardPage({super.key, required this.user});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Dashboard'),
          ),
          body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                Text(widget.user.phoneNumber),
                Text(widget.user.name ?? ''),
                Text(widget.user.email ?? ''),
                Text(widget.user.address ?? ''),
                TextButton(
                    onPressed: () => {
                          context.read<LoginBloc>().add(LogoutEvent()),
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
      },
    );
  }
}
