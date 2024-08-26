import 'package:flutter_application_1/views/screens/login/models/data.dart';
import 'package:flutter_application_1/views/screens/login/models/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<ShowRegisterEvent>(
      (event, emit) {
        emit(RegisterState());
      },
    );

    on<ShowLoginEvent>(
      (event, emit) {
        emit(LoginStatePage());
      },
    );

    on<ShowConfirmOtpEvent>((event, emit) async {
      final RegExp phoneRegex = RegExp(r'^0\d+$');

      if (phoneRegex.hasMatch(event.phoneNumber)) {
        emit(ConfirmOtpState(event.phoneNumber));
      }
    });

    on<ShowCreatePasswordEvent>(
      (event, emit) {
        emit(CreatePasswordState(event.phoneNumber));
      },
    );

    on<LoginButtonPressed>((event, emit) async {
      emit(LoginLoading());

      await Future.delayed(const Duration(seconds: 2));

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
        emit(const LoginFailure('Sai số điện thoại hoặc mật khẩu'));
      }
    });

    on<CreatePasswordPressed>(
      (event, emit) {
        if (event.password == event.passwordConfirm &&
            event.phoneNumber != '') {
          User user = User(
              phoneNumber: event.phoneNumber,
              password: event.password,
              address: '',
              email: '',
              name: '');
          mockData.add(user);
          emit(LoginStatePage());
        }
      },
    );
  }
}
