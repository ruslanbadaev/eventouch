class ResponseDataModel {
  String? response;
  String? error;

  ResponseDataModel({
    this.response,
    this.error,
  });

  factory ResponseDataModel.fromJson(Map<String, dynamic> json) {
    return ResponseDataModel(
      response: json['response'],
      error: json['error'],
    );
  }
}
