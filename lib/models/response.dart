// class ResponseModel {
//   String? response;
//   String? error;

import 'dart:developer';

import 'response_error.dart';

class ResponseModel<T> {
  final T? response;
  final ErrorMessage? error;

  ResponseModel(
    this.response,
    this.error,
  );

  factory ResponseModel.fromJson(
    Map<String, dynamic> json, {
    Function? fromJson,
  }) {
    try {
      final response;
      if (fromJson == null) {
        log(json.toString(), name: 'ResponseModel.fromJson');

        return ResponseModel(
          null,
          json['error'] == null
              ? (json['errors'] == null ? null : ErrorMessageModel.fromJson(json['errors']))
              : ErrorMessageModel.fromJson(json['error'] is Map<String, dynamic> ? json['error'] : json),
        );
      }

      response = fromJson(json['docs'] ?? json);

      // if (json['result']['docs'] != null) {
      //   response = fromJson(json['result']['docs']);
      // } else if (json['result'] != null) {
      //   response = fromJson(json['result']);
      // } else {
      //   response = fromJson(json);
      // }

      return ResponseModel(
        response,
        json['error'] == null
            ? null
            : ErrorMessageModel.fromJson(json['error'] is Map<String, dynamic> ? json['error'] : json),
      );
    } catch (e) {
      print('ResponseModel fromJson :: $e');
      return ResponseModel(null, null);
    }
  }
}
