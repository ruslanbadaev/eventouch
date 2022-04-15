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
    if (data['msg'] is List) {}
    if (data['msg'] is String) {
      data['msg'] = [data['msg']];
    }
    if (data['msg'] == null) {}

    return ErrorMessageModel(
      code: data['code'],
      messages: data['msg'],
    );
  }

  @override
  String toString() {
    return 'ErrorMessageModel{code: $code, messages: $messages}';
  }
}
