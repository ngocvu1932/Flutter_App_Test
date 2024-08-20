import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginButtonPressed extends LoginEvent {
  final String phoneNumber;
  final String password;

  const LoginButtonPressed({required this.phoneNumber, required this.password});

  @override
  List<Object> get props => [phoneNumber, password];
}

class GetOTPCodeButtonPressed extends LoginEvent {
  final String phoneNumber;

  const GetOTPCodeButtonPressed({required this.phoneNumber});

  @override
  List<Object> get props => [phoneNumber];
}
