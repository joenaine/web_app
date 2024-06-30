import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:desoto_web/domain/auth/auth_failure.dart';
import 'package:desoto_web/infrastructure/auth/firebase_auth_facade.dart';
import 'package:desoto_web/infrastructure/registration/registration_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'sign_in_buttons_bloc.freezed.dart';
part 'sign_in_buttons_event.dart';
part 'sign_in_buttons_state.dart';

@injectable
class SignInButtonsBloc extends Bloc<SignInButtonsEvent, SignInButtonsState> {
  final FirebaseAuthFacade _authFacade;
  final RegistrationRepository _registrationRepository;

  SignInButtonsBloc(this._authFacade, this._registrationRepository)
      : super(SignInButtonsState.initial()) {
    on<SignInButtonsEvent>((event, emit) async {
      await event.map(
        signInWithGooglePressed: (e) async {
          await _performActionOnAuthFacade(
            _authFacade.signInWithGoogle,
            emit,
          );
        },
        signInWithEmail: (e) async {
          emit(
            state.copyWith(
              isSubmitting: true,
              authFailureOrSuccessOption: none(),
            ),
          );

          final failureOrSuccess = await _authFacade.signInWithEmail(
              email: e.email, password: e.password);

          emit(
            state.copyWith(
              isSubmitting: false,
              authFailureOrSuccessOption: some(failureOrSuccess),
            ),
          );
        },
        signUpWithEmail: (e) async {
          emit(
            state.copyWith(
              isSubmitting: true,
              authFailureOrSuccessOption: none(),
            ),
          );

          final failureOrSuccess = await _authFacade
              .signUpWithEmail(email: e.email, password: e.password)
              .then((value) async {
            final authFire = FirebaseAuth.instance;
            User? usr = authFire.currentUser;
            return await _registrationRepository.saveUser(
                id: usr!.uid, name: e.name, password: e.password);
          });

          emit(
            state.copyWith(
              isSubmitting: false,
              authFailureOrSuccessOption: some(failureOrSuccess),
            ),
          );
        },
      );
    });
  }

  Future<void> _performActionOnAuthFacade(
    Future<Either<AuthFailure, Unit>> Function() forwardedCall,
    Emitter<SignInButtonsState> emit,
  ) async {
    emit(
      state.copyWith(
        isSubmitting: true,
        authFailureOrSuccessOption: none(),
      ),
    );

    final failureOrSuccess = await forwardedCall();

    emit(
      state.copyWith(
        isSubmitting: false,
        authFailureOrSuccessOption: some(failureOrSuccess),
      ),
    );
  }
}
