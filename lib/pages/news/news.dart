import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../models/post.dart';
import '../../utils/constants/colors.dart';
import 'controller.dart';
import 'widgets/post.dart';

class News extends StatefulWidget {
  News({Key? key}) : super(key: key);

  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsController>(
      init: NewsController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: EasyRefresh(
            onRefresh: () async {
              controller.getNews();
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  for (PostModel post in controller.posts)
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(2, 3),
                            blurRadius: 7,
                            color: AppColors.SHADOW,
                          )
                        ],
                        color: AppColors.WHITE,
                      ),
                      child: Slidable(
                        key: ValueKey(post.id),
                        startActionPane: ActionPane(
                          motion: const BehindMotion(),
                          children: [
                            SlidableAction(
                              backgroundColor: AppColors.RED,
                              foregroundColor: AppColors.WHITE,
                              icon: Icons.delete,
                              label: 'Удалить',
                              onPressed: (BuildContext context) => {},
                            ),
                          ],
                        ),
                        endActionPane: ActionPane(
                          motion: BehindMotion(),
                          children: [
                            SlidableAction(
                              backgroundColor: AppColors.GOLD,
                              foregroundColor: AppColors.WHITE,
                              icon: Icons.edit_rounded,
                              label: 'Изменить',
                              onPressed: (BuildContext context) => {
                                controller.selectPost(post),
                                showMaterialModalBottomSheet(
                                  context: context,
                                  expand: true,
                                  builder: (context) => Container(
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 96,
                                          ),
                                          ListTile(
                                            title: Text(
                                              'Id:',
                                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
                                            ),
                                            subtitle: Text(
                                              post.id,
                                              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          ListTile(
                                            title: Text(
                                              'Заголовок:',
                                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
                                            ),
                                            subtitle: TextField(
                                              controller: controller.titleController,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          ListTile(
                                            title: Text(
                                              'Короткий текст:',
                                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
                                            ),
                                            subtitle: TextField(
                                              controller: controller.introTextController,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          ListTile(
                                            title: Text(
                                              'Полный текст:',
                                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
                                            ),
                                            subtitle: TextField(
                                              controller: controller.fullTextTextController,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 24,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Card(
                                                child: InkWell(
                                                  onTap: () {
                                                    Get.back();
                                                  },
                                                  child: Container(
                                                    width: ScreenUtil.defaultSize.width / 2,
                                                    padding: EdgeInsets.all(24),
                                                    child: Text(
                                                      'Отменить',
                                                      style: TextStyle(
                                                        color: Colors.orange,
                                                        fontWeight: FontWeight.w700,
                                                      ),
                                                      textAlign: TextAlign.center,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Card(
                                                child: InkWell(
                                                  onTap: () {
                                                    controller.updatePost();
                                                    Get.back();
                                                  },
                                                  child: Container(
                                                    width: ScreenUtil.defaultSize.width / 2,
                                                    padding: EdgeInsets.all(24),
                                                    child: Text(
                                                      'Сохранить',
                                                      style: TextStyle(
                                                        color: AppColors.GREEN,
                                                        fontWeight: FontWeight.w700,
                                                      ),
                                                      textAlign: TextAlign.center,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              },
                            ),
                          ],
                        ),
                        child: PostWidget(
                          id: post.id,
                          title: post.title,
                          introText: post.introText,
                          fullText: post.fullText,
                          date: post.date,
                          views: post.views,
                          createdAt: post.createdAt,
                          updatedAt: post.updatedAt,
                          images: post.images,
                          onPressed: () {},
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => {},
            child: Icon(
              Icons.add_rounded,
              size: 36,
              color: AppColors.PRIMARY,
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        );
      },
    );
  }
}
