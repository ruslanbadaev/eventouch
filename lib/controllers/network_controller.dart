import 'package:dio/dio.dart';
import 'package:pres7t/models/event.dart';

import '../models/image.dart';
import '../models/post.dart';
import '../models/response.dart';
import '../models/token.dart';
import '../utils/constants/links.dart';

class NetworkController {
  static Future<ResponseModel<TokenPairModel>> signIn({
    required String login,
    required String password,
  }) async {
    try {
      Response response = await Dio().post(
        '${AppLinks.HOST}/login',
        data: {
          'email': login,
          'password': password,
        },
      );

      // print(response.data);
      return ResponseModel<TokenPairModel>.fromJson(
        response.data as Map<String, dynamic>,
        fromJson: TokenPairModel.fromJson,
      );
    } on DioError catch (error) {
      print('signIn :: $error');
      return ResponseModel<TokenPairModel>.fromJson(
        error.response?.data as Map<String, dynamic>,
        fromJson: null,
      );
    }
  }

  static Future<ResponseModel<List<EventModel>>> getEvents() async {
    try {
      Response response = await Dio().get('${AppLinks.HOST}/events');

      return ResponseModel<List<EventModel>>.fromJson(
        response.data as Map<String, dynamic>,
        fromJson: EventModel.listFromJson,
      );
    } on DioError catch (error) {
     
      return ResponseModel<List<EventModel>>.fromJson(
        error.response?.data as Map<String, dynamic>,
        fromJson: null,
      );
    }
  }

  static Future<ResponseModel<List<PostModel>>> updatePost({
    required String id,
    required String title,
    required String introText,
    required String fullText,
    required String date,
    required int views,
    required List<ImageModel> images,
  }) async {
    try {
      Response response = await Dio().patch(
        '${AppLinks.HOST}/news/$id',
        data: {
          "title": title,
          "introText": introText,
          "fullText": fullText,
          "date": date,
          "views": views,
          "images": [for (ImageModel image in images) ImageModel.toJson(image)],
        },
      );

      return ResponseModel<List<PostModel>>.fromJson(
        response.data as Map<String, dynamic>,
        fromJson: PostModel.listFromJson,
      );
    } on DioError catch (error) {
      print(error);
      return ResponseModel<List<PostModel>>.fromJson(
        error.response?.data as Map<String, dynamic>,
        fromJson: null,
      );
    }
  }
}
