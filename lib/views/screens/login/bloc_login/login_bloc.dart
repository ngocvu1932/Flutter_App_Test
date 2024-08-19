import 'package:flutter_application_1/views/screens/login/bloc_login/login_event.dart';
import 'package:flutter_application_1/views/screens/login/bloc_login/login_state.dart';
import 'package:flutter_application_1/views/screens/login/data.dart';
import 'package:flutter_application_1/views/screens/login/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    // Xử lý sự kiện LoginButtonPressed
    on<LoginButtonPressed>((event, emit) async {
      emit(LoginLoading());

      await Future.delayed(const Duration(milliseconds: 300));
      User? user;

      for (var userIn in mockData) {
        if (userIn.phoneNumber == event.phoneNumber &&
            userIn.password == event.password) {
          user = userIn;
          break;
        }
      }

      if (user != null) {
        emit(LoginSuccess(user));
      } else {
        emit(const LoginFailure(error: 'Sai số điện thoại hoặc mật khẩu'));
      }
    });
  }
}
