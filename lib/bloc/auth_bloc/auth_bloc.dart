import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(AuthState initialState) : super(initialState);

  Stream<AuthState> _mapAuthenticateToState(Authenticate event) async* {
    yield Authenticating();
    await Future.delayed(Duration(seconds: 3));
    yield Authenticated();
  }

  Stream<AuthState> _mapLogoutToState(Logout event) async* {
    yield LoggingOut();
    await Future.delayed(Duration(seconds: 3));
    yield UnAuthenticated();
  }

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is Authenticate) {
      yield* _mapAuthenticateToState(event);
    } else if (event is Logout) {
      yield* _mapLogoutToState(event);
    }
  }
}
