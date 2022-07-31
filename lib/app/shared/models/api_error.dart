import 'package:flutter/foundation.dart';

class ApiError {
  List<Error>? errors;
  int? status;

  ApiError({this.errors, this.status});

  factory ApiError.fromJson(Map<String, dynamic> json) {
    if (kDebugMode) {
      print(json);
    }
    return ApiError(
      errors: json['errors'] != null &&
          json['errors'] is Map &&
          (json['errors'] as Map).isNotEmpty == true
          ? (json['errors'] as Map)
          .entries
          .map((e) => Error(
          key: e.key.toString(),
          messages:
          (e.value as List).map((e) => e.toString()).toList()))
          .toList()
          : List<Error>.empty(),
      status: json['status'],
    );
  }
}

class Error {
  String? key;
  List<String>? messages;

  Error({this.key, this.messages});
}
