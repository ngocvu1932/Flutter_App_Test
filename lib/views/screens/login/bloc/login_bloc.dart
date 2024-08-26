import 'package:flutter_application_1/views/screens/login/models/data.dart';
import 'package:flutter_application_1/views/screens/login/models/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<ShowRegisterEvent>(
      (event, emit) {
        emit(state.copyWith(
          isError: false,
          widgetStatePage: WidgetStatePage.register,
        ));
      },
    );

    on<LogoutEvent>((event, emit) {
      emit(state.copyWith(
        isError: false,
        widgetStatePage: WidgetStatePage.login,
        isValidLogin: false,
      ));
    });

    on<ShowLoginEvent>(
      (event, emit) {
        emit(state.copyWith(
          isError: false,
          widgetStatePage: WidgetStatePage.login,
        ));
      },
    );

    on<ShowCreatePasswordEvent>(
      (event, emit) {
        emit(
          state.copyWith(
            isError: false,
            phoneNumber: event.phoneNumber,
            widgetStatePage: WidgetStatePage.createPassword,
          ),
        );
      },
    );

    on<CreatePasswordPressed>(
      (event, emit) async {
        emit(state.copyWith(
          isError: false,
          isLoading: true,
          isCreatePassword: false,
          messageState: '',
        ));

        await Future.delayed(const Duration(seconds: 2));

        if (event.password == '' || event.passwordConfirm == '') {
          emit(state.copyWith(
            isError: true,
            isLoading: false,
            messageState: 'Mật khẩu không được để trống!',
          ));
          return;
        }

        if (event.password == event.passwordConfirm &&
            event.phoneNumber != '') {
          User user = User(
              phoneNumber: event.phoneNumber,
              password: event.password,
              address: '',
              email: '',
              name: '');
          mockData.add(user);
          emit(state.copyWith(
            isError: false,
            isLoading: false,
            isCreatePassword: true,
            messageState: 'Tạo tài khoản thành công!',
            widgetStatePage: WidgetStatePage.login,
          ));
        } else {
          emit(state.copyWith(
            isError: true,
            isLoading: false,
            messageState: 'Mật khẩu không khớp!',
          ));
        }
      },
    );

    on<ShowConfirmOtpEvent>(
      (event, emit) async {
        final RegExp phoneRegex = RegExp(r'^0\d+$');

        emit(state.copyWith(
          isError: false,
          isLoading: true,
        ));

        event.isBack ? '' : await Future.delayed(const Duration(seconds: 2));

        if (phoneRegex.hasMatch(event.phoneNumber)) {
          emit(state.copyWith(
            phoneNumber: event.phoneNumber,
            isLoading: false,
            widgetStatePage: WidgetStatePage.confirmOtp,
          ));
        } else {
          emit(state.copyWith(
            isLoading: false,
            isError: true,
            messageState: 'Số điện thoại không hợp lệ!',
          ));
        }
      },
    );
    on<LoginButtonPressed>((event, emit) async {
      emit(state.copyWith(
          isError: false,
          isLoading: true,
          messageState: '',
          isCreatePassword: false));

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
        emit(state.copyWith(
          isLoading: false,
          isError: false,
          messageState: 'Đăng nhập thành công!',
          user: user,
          isValidLogin: true,
        ));
      } else {
        emit(state.copyWith(
          isLoading: false,
          isError: true,
          messageState: 'Sai số điện thoại hoặc mật khẩu!',
        ));
      }
    });
  }
}
