part of 'auth_bloc.dart';

abstract class AuthEvent {}

class Authenticate extends AuthEvent {}

class Logout extends AuthEvent {}
