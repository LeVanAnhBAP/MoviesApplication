import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_response.freezed.dart';

part 'base_response.g.dart';

@Freezed(genericArgumentFactories: true)
class BaseResponse<T> with _$BaseResponse<T> {
  const factory BaseResponse({
    required T data,
  }) = BaseResponseData;

  factory BaseResponse.fromJson(
          String jsonString, T Function(Object?) fromJsonT) =>
      _$BaseResponseFromJson(jsonDecode(jsonString), fromJsonT);
}
