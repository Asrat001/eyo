import 'package:freezed_annotation/freezed_annotation.dart';
import '../utils/network_exceptions_utils.dart';
part 'api_response.freezed.dart';

@freezed
class ApiResponse<T> with _$ApiResponse<T> {
  const factory ApiResponse.success({required T data}) = Success<T>;
  const factory ApiResponse.failure({required NetworkExceptions error}) =
  Failure<T>;
}