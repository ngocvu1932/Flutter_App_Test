part of 'login_bloc.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginStatePage extends LoginState {}

class RegisterState extends LoginState {}

class ConfirmOtpState extends LoginState {
  final String phoneNumber;
  const ConfirmOtpState(this.phoneNumber);

  @override
  List<Object> get props => [phoneNumber];
}

class CreatePasswordState extends LoginState {
  final String phoneNumber;
  const CreatePasswordState(this.phoneNumber);

  @override
  List<Object> get props => [phoneNumber];
}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final User user;
  const LoginSuccess(this.user);

  @override
  List<Object> get props => [user];
}

final class LoginFailure extends LoginState {
  final String error;
  const LoginFailure(this.error);

  @override
  List<Object> get props => [error];
}
