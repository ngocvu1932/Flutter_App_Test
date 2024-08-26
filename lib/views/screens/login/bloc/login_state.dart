part of 'login_bloc.dart';

enum WidgetStatePage { login, register, confirmOtp, createPassword }

class LoginState extends Equatable {
  final WidgetStatePage widgetStatePage;
  final String phoneNumber;
  final String password;
  final bool isValidLogin;
  final bool isLoading;
  final bool isError;
  final String messageState;
  final bool isCreatePassword;
  late final User user;

  LoginState({
    this.widgetStatePage = WidgetStatePage.login,
    this.phoneNumber = '',
    this.password = '',
    this.isValidLogin = false,
    this.isLoading = false,
    this.isError = false,
    this.messageState = '',
    this.isCreatePassword = false,
    User? user,
  }) {
    this.user = user ?? User(phoneNumber: '', password: '');
  }

  LoginState copyWith({
    WidgetStatePage? widgetStatePage,
    String? phoneNumber,
    String? password,
    bool? isValidLogin,
    bool? isLoading,
    bool? isError,
    String? messageState,
    bool? isCreatePassword,
    User? user,
  }) {
    return LoginState(
      widgetStatePage: widgetStatePage ?? this.widgetStatePage,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
      isValidLogin: isValidLogin ?? this.isValidLogin,
      isLoading: isLoading ?? this.isLoading,
      isError: isError ?? this.isError,
      messageState: messageState ?? this.messageState,
      isCreatePassword: isCreatePassword ?? this.isCreatePassword,
      user: user ?? this.user,
    );
  }

  @override
  List<Object> get props => [
        widgetStatePage,
        phoneNumber,
        password,
        isValidLogin,
        isLoading,
        isError,
        messageState,
        isCreatePassword
      ];
}
