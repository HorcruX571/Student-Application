import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:assignment/features/auth/data/auth_repository.dart';
import 'package:assignment/features/auth/presentation/bloc/auth_event.dart';
import 'package:assignment/features/auth/presentation/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(AuthInitial()) {
    on<AuthLoginEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await authRepository.login(event.email, event.password);
        emit(AuthSuccess(user: user));
      } catch (e) {
        emit(AuthFailure(errorMessage: e.toString()));
      }
    });

    on<AuthSignupEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await authRepository.signup(event.email, event.password);
        emit(AuthSuccess(user: user));
      } catch (e) {
        emit(AuthFailure(errorMessage: e.toString()));
      }
    });
  }
}
