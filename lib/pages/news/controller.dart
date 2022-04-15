import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import '../../controllers/network_controller.dart';
import '../../models/post.dart';

class NewsController extends GetxController {
  @override
  void onInit() {
    getNews();
    super.onInit();
  }

  List<PostModel> _posts = [];
  List<PostModel> get posts => _posts;
  PostModel? _selectedPost;

  TextEditingController titleController = TextEditingController();
  TextEditingController introTextController = TextEditingController();
  TextEditingController fullTextTextController = TextEditingController();

  PostModel? get selectedPost => _selectedPost;

  void selectPost(PostModel post) {
    _selectedPost = post;
    titleController.text = post.title;
    introTextController.text = post.introText;
    fullTextTextController.text = post.fullText;
    update();
  }

  void getNews() async {
    _posts = (await NetworkController.getNews()).response as List<PostModel>;
    update();
  }

  void updatePost() async {
    await NetworkController.updatePost(
      id: _selectedPost!.id,
      title: _selectedPost!.title,
      introText: _selectedPost!.introText,
      fullText: _selectedPost!.fullText,
      date: _selectedPost!.date,
      views: _selectedPost!.views,
      images: _selectedPost!.images,
    );
    await NetworkController.getNews();
    update();
  }
}
