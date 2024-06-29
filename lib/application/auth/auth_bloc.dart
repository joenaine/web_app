import 'package:desoto_web/infrastructure/auth/firebase_auth_facade.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuthFacade _authFacade;

  AuthBloc(this._authFacade) : super(const AuthState.initial()) {
    on<AuthEvent>((event, emit) async {
      await event.map(
        authCheckRequested: (e) async {
          final userOption = await _authFacade.getSignedInUser();
          emit(
            userOption.fold(
              () => const AuthState.unauthenticated(),
              (_) => const AuthState.authenticated(),
            ),
          );
        },
        signedOut: (e) async {
          await _authFacade.signOut();
          emit(const AuthState.unauthenticated());
        },
        deleteAccount: (e) async {
          await _authFacade.deleteAccount();
          emit(const AuthState.unauthenticated());
        },
      );
    });
  }
}
