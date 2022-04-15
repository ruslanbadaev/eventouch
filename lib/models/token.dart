class TokenPairModel {
  final String token;
  final String refreshToken;

  TokenPairModel({
    required this.token,
    required this.refreshToken,
  });

  static fromJson(Map<String, dynamic> json) {
    return TokenPairModel(
      token: json['token'],
      refreshToken: json['refresh_token'],
    );
  }
}
