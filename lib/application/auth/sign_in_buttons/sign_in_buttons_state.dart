part of 'sign_in_buttons_bloc.dart';

@freezed
class SignInButtonsState with _$SignInButtonsState {
  const factory SignInButtonsState({
    required bool showErrorMessages,
    required bool isSubmitting,
    required Option<Either<AuthFailure, dynamic>> authFailureOrSuccessOption,
  }) = _SignInButtonsState;

  factory SignInButtonsState.initial() => SignInButtonsState(
        showErrorMessages: false,
        isSubmitting: false,
        authFailureOrSuccessOption: none(),
      );
}
