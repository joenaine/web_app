import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failure.freezed.dart';

@freezed
class AuthFailure with _$AuthFailure {
  const factory AuthFailure.cancelledByUser() = CancelledByUser;
  const factory AuthFailure.serverError() = ServerError;
  const factory AuthFailure.invalidCredentials() = InvalidCredentials;
  const factory AuthFailure.networkError() = NetworkError;
  const factory AuthFailure.credentialAlreadyUsed() = CredentialAlreadyUsed;
}
