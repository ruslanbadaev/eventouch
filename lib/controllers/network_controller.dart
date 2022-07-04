import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:get_storage/get_storage.dart';
import 'package:pres7t/models/event_marker.dart';
import 'package:pres7t/models/user.dart';
import 'package:pres7t/utils/app_errors.dart';

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

  Future<ResponseModel<UserModel>> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      Response response = await dio.post(
        '${AppLinks.HOST}/register',
        data: {
          'name': name,
          'email': email,
          'password': password,
        },
      );

      if (response.data['token'] == null) throw 'TOKEN_IS_EMPTY';
      saveToken(response.data['token']);
      log('||||||||||4 ${response.data}');

      return ResponseModel<UserModel>.fromJson(
        response.data['user'] as Map<String, dynamic>,
        fromJson: UserModel.fromJson,
      );
    } on DioError catch (error) {
      log('||||||||||3 $error');

      return ResponseModel<UserModel>.fromJson(
        error.response?.data as Map<String, dynamic>,
        fromJson: null,
      );
    } catch (error) {
      log('||||||||||2 $error');

      return ResponseModel<UserModel>.fromJson(
        {'error': error},
        fromJson: null,
      );
    }
  }

  Future<ResponseModel<UserModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      Response response = await dio.post(
        '${AppLinks.HOST}/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.data['token'] == null) throw 'TOKEN_IS_EMPTY';
      saveToken(response.data['token']);
      saveUser(UserModel.fromJson(response.data['user']));

      return ResponseModel<UserModel>.fromJson(
        response.data['user'] as Map<String, dynamic>,
        fromJson: UserModel.fromJson,
      );
    } on DioError catch (error) {
      log('||||||||||3 $error');

      return ResponseModel<UserModel>.fromJson(
        error.response?.data as Map<String, dynamic>,
        fromJson: null,
      );
    } catch (error) {
      log('||||||||||2 $error');

      return ResponseModel<UserModel>.fromJson(
        {'error': error},
        fromJson: null,
      );
    }
  }

  Future<ResponseModel<UserModel>> createEvent({
    required String type,
    required String title,
    required String aboutEvent,
    required String aboutYou,
    required String aboutLocation,
    required double lat,
    required double long,
    required List<String> images,
    required String date,
  }) async {
    try {
      Response response = await dio.post(
        '${AppLinks.HOST}/login',
        data: {},
      );

      return ResponseModel<UserModel>.fromJson(
        response.data['user'] as Map<String, dynamic>,
        fromJson: UserModel.fromJson,
      );
    } on DioError catch (error) {
      return ResponseModel<UserModel>.fromJson(
        error.response?.data as Map<String, dynamic>,
        fromJson: null,
      );
    } catch (error) {
      return ResponseModel<UserModel>.fromJson(
        {'error': error},
        fromJson: null,
      );
    }
  }

  Future<ResponseModel<List<EventModel>>> getEventsHistory({required EventStatus status}) async {
    try {
      log('${AppLinks.HOST}/events?status=${status.name}');
      Response response = await dio.get('${AppLinks.HOST}/events?status=${status.name}');
      print(response.data);

      return ResponseModel<List<EventModel>>.fromJson(
        response.data as Map<String, dynamic>,
        fromJson: EventModel.listFromJson,
      );
    } on DioError catch (error) {
      return ResponseModel<List<EventModel>>.fromJson(
        {'error': AppErrors.parseNetworkError(error)},
        fromJson: null,
      );
    }
  }

  Future<ResponseModel<List<EventMarkerModel>>> getEventsByPosition({
    required double lat,
    required double lng,
  }) async {
    try {
      log('${AppLinks.HOST}/events/position', name: 'R --->');
      Response response = await dio.get(
        '${AppLinks.HOST}/events/position',
        queryParameters: {
          "lat": 13,
          "lng": 109,
        },
      );

      print(response.data);

      return ResponseModel<List<EventMarkerModel>>.fromJson(
        response.data as Map<String, dynamic>,
        fromJson: EventMarkerModel.listFromJson,
      );
    } on DioError catch (error) {
      return ResponseModel<List<EventMarkerModel>>.fromJson(
        {'error': AppErrors.parseNetworkError(error)},
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
