abstract class ErrorMessage {
  String? get code;
  String? get message;
}

class ErrorMessageModel extends ErrorMessage {
  @override
  final String? code;
  @override
  final String message;

  ErrorMessageModel({
    this.code,
    required this.message,
  });

  factory ErrorMessageModel.fromJson(Map<String, dynamic> data) {
    try {
      // log(data.toString(), name: 'ErrorMessageModel.fromJson');
      // if (data['msg'] is List) {}
      // if (data['msg'] is String) {
      //   data['msg'] = [data['msg']];
      // }
      // if (data['msg'] == null) {}
      // log(data['error'] ?? data, name: '?? data');
      return ErrorMessageModel(
        code: null,
        message: data['error'],
      );
    } catch (e) {
      return ErrorMessageModel(
        code: null,
        message: data.toString(),
      );
    }
  }

  @override
  String toString() {
    return 'ErrorMessageModel{code: $code, messages: $message}';
  }
}
