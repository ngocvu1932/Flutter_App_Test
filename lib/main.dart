import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/screens/login/bloc_login/login_bloc.dart';
import 'package:flutter_application_1/views/screens/login/login_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<LoginBloc>(create: (context) => LoginBloc()),
      BlocProvider<GetOTPBloc>(create: (context) => GetOTPBloc())
    ], child: const GetMaterialApp(home: LoginScreen()));
  }
}
