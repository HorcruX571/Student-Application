import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthLoginEvent extends AuthEvent {
  final String email;
  final String password;

  AuthLoginEvent({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class AuthSignupEvent extends AuthEvent {
  final String email;
  final String password;
  final String role;

  AuthSignupEvent(
      {required this.email, required this.password, required this.role});

  @override
  List<Object> get props => [email, password, role];
}

class AuthGetUserEvent extends AuthEvent {
  final String token;

  AuthGetUserEvent({required this.token});

  @override
  List<Object> get props => [token];
}
