import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/screens/login/bloc_login/login_bloc.dart';
import 'package:flutter_application_1/views/screens/login/bloc_login/login_state.dart';
import 'package:flutter_application_1/views/screens/login/widget_current.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConfirmOtpForm extends StatefulWidget {
  final void Function(WidgetCurrent) state;
  const ConfirmOtpForm({super.key, required this.state});

  @override
  State<ConfirmOtpForm> createState() => _ConfirmOtpFormState();
}

class _ConfirmOtpFormState extends State<ConfirmOtpForm> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<GetOTPBloc, LoginState>(
        listener: (context, state) {},
        child: BlocBuilder<GetOTPBloc, LoginState>(builder: (context, state) {
          return Text('Confirm OTP Form');
        }));
  }
}


// class _ConfirmOtpFormState extends State<ConfirmOtpForm> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<GetOTPBloc, LoginState>(
//       listener: (context, state) {},
//       child: BlocBuilder<GetOTPBloc, LoginState>(
//         builder: (context, state) {
//           // Hiển thị nội dung dựa trên trạng thái
//           return Center(
//             child: Text('Confirm OTP Form'),
//           );
//         },
//       ),
//     );
//   }
// }
