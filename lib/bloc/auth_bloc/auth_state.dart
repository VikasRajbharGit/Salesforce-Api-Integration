part of 'auth_bloc.dart';

abstract class AuthState {}

class AuthInitialized extends AuthState {}

class UnAuthenticated extends AuthState {}

class LoggingOut extends AuthState {}

class Authenticating extends AuthState {}

class Authenticated extends AuthState {}
