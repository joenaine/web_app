import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:desoto_web/domain/auth/auth_failure.dart';
import 'package:desoto_web/infrastructure/auth/firebase_auth_facade.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'sign_in_buttons_bloc.freezed.dart';
part 'sign_in_buttons_event.dart';
part 'sign_in_buttons_state.dart';

@injectable
class SignInButtonsBloc extends Bloc<SignInButtonsEvent, SignInButtonsState> {
  final FirebaseAuthFacade _authFacade;

  SignInButtonsBloc(this._authFacade) : super(SignInButtonsState.initial()) {
    on<SignInButtonsEvent>((event, emit) async {
      await event.map(
        signInWithGooglePressed: (e) async {
          await _performActionOnAuthFacade(
            _authFacade.signInWithGoogle,
            emit,
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
