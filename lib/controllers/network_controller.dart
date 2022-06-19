import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;

import '../mixins/cache_manager.dart';
import '../models/event.dart';
import '../models/response.dart';
import '../models/token.dart';
import '../pages/events_history/controller.dart';
import '../utils/constants/links.dart';

class NetworkController extends GetxController with CacheManager {
  final dio = Dio();

  Future<ResponseModel<TokenPairModel>> signIn({
    required String login,
    required String password,
  }) async {
    try {
      Response response = await dio.post(
        '${AppLinks.HOST}/login',
        data: {
          'email': login,
          'password': password,
        },
      );

      return ResponseModel<TokenPairModel>.fromJson(
        response.data as Map<String, dynamic>,
        fromJson: TokenPairModel.fromJson,
      );
    } on DioError catch (error) {
      return ResponseModel<TokenPairModel>.fromJson(
        error.response?.data as Map<String, dynamic>,
        fromJson: null,
      );
    }
  }

  Future<ResponseModel<List<EventModel>>> getEventsHistory({required EventStatus status}) async {
    try {
      Response response = await dio.get('${AppLinks.HOST}/events?status=${status.name}');

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

  // static Future<ResponseModel<List<PostModel>>> updatePost({
  //   required String id,
  //   required String title,
  //   required String introText,
  //   required String fullText,
  //   required String date,
  //   required int views,
  //   required List<ImageModel> images,
  // }) async {
  //   try {
  //     Response response = await Dio().patch(
  //       '${AppLinks.HOST}/news/$id',
  //       data: {
  //         "title": title,
  //         "introText": introText,
  //         "fullText": fullText,
  //         "date": date,
  //         "views": views,
  //         "images": [for (ImageModel image in images) ImageModel.toJson(image)],
  //       },
  //     );

  //     return ResponseModel<List<PostModel>>.fromJson(
  //       response.data as Map<String, dynamic>,
  //       fromJson: PostModel.listFromJson,
  //     );
  //   } on DioError catch (error) {
  //     print(error);
  //     return ResponseModel<List<PostModel>>.fromJson(
  //       error.response?.data as Map<String, dynamic>,
  //       fromJson: null,
  //     );
  //   }
  // }
}
