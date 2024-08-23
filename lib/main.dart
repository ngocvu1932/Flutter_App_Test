import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/screens/login/bloc/login_bloc.dart';
import 'package:flutter_application_1/views/screens/login/login_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: LoginScreen(),
    );
  }
}
