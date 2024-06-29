import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
class ValueFailure<T> with _$ValueFailure<T> {
  // Search text failures
  const factory ValueFailure.exceedingLength({
    required T valueFailure,
    required int max,
  }) = ExceedingLength<T>;
}
