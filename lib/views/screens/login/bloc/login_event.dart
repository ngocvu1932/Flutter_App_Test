part of 'login_bloc.dart';

abstract class WidgetEvent extends Equatable {
  const WidgetEvent();

  @override
  List<Object> get props => [];
}

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class ShowLoginEvent extends LoginEvent {}

class LogoutEvent extends LoginEvent {}

class ShowRegisterEvent extends LoginEvent {}

class ShowConfirmOtpEvent extends LoginEvent {
  final String phoneNumber;
  final bool isBack;

  const ShowConfirmOtpEvent({required this.phoneNumber, required this.isBack});

  @override
  List<Object> get props => [phoneNumber, isBack];
}

class ShowCreatePasswordEvent extends LoginEvent {
  final String phoneNumber;

  const ShowCreatePasswordEvent({required this.phoneNumber});

  @override
  List<Object> get props => [phoneNumber];
}

class LoginButtonPressed extends LoginEvent {
  final String phoneNumber;
  final String password;

  const LoginButtonPressed({required this.phoneNumber, required this.password});

  @override
  List<Object> get props => [phoneNumber, password];
}

class CreatePasswordPressed extends LoginEvent {
  final String phoneNumber;
  final String password;
  final String passwordConfirm;

  const CreatePasswordPressed(
      {required this.phoneNumber,
      required this.password,
      required this.passwordConfirm});

  @override
  List<Object> get props => [phoneNumber, password, passwordConfirm];
}
