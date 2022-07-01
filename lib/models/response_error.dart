import 'dart:developer';

abstract class ErrorMessage {
  String? get code;
  List? get messages;
}

class ErrorMessageModel extends ErrorMessage {
  @override
  final String? code;
  @override
  final List messages;

  ErrorMessageModel({
    this.code,
    required this.messages,
  });

  factory ErrorMessageModel.fromJson(Map<String, dynamic> data) {
    try {
      log(data.toString(), name: 'ErrorMessageModel.fromJson');
      if (data['msg'] is List) {}
      if (data['msg'] is String) {
        data['msg'] = [data['msg']];
      }
      if (data['msg'] == null) {}
      log(data['error'] ?? data, name: '?? data');
      return ErrorMessageModel(
        code: data['code'],
        messages: [data['msg'] ?? data['error'] ?? data],
      );
    } catch (e) {
      return ErrorMessageModel(
        code: data['code'],
        messages: [data.toString()],
      );
    }
  }

  @override
  String toString() {
    return 'ErrorMessageModel{code: $code, messages: $messages}';
  }
}
