part of 'sign_in_buttons_bloc.dart';

@freezed
class SignInButtonsEvent with _$SignInButtonsEvent {
  const factory SignInButtonsEvent.signInWithGooglePressed() =
      SignInWithGooglePressed;
  const factory SignInButtonsEvent.signInWithEmail(
      {required String email, required String password}) = SignInWithEmail;
  const factory SignInButtonsEvent.signUpWithEmail(
      {required String name,
      required String email,
      required String password}) = SignUpWithEmail;
}
