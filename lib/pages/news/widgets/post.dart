import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../models/image.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/links.dart';

class PostWidget extends StatefulWidget {
  String id;
  String title;
  String introText;
  String fullText;
  String date;
  int views;
  String createdAt;
  String updatedAt;
  Function onPressed;
  List<ImageModel>? images;
  PostWidget({
    Key? key,
    required this.id,
    required this.title,
    required this.introText,
    required this.fullText,
    required this.date,
    required this.views,
    required this.createdAt,
    required this.updatedAt,
    required this.onPressed,
    this.images,
  }) : super(key: key);

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  bool _showItems = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        setState(() {
          _showItems = !_showItems;
        }),
        widget.onPressed(),
      },
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: 12,
          ),
          if (widget.images != null && widget.images!.isNotEmpty)
            CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: false,
                reverse: false,
                autoPlay: false,
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                onPageChanged: (_, __) => {},
                scrollDirection: Axis.horizontal,
              ),
              items: widget.images?.map((image) {
                return Builder(
                  builder: (BuildContext context) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: AppColors.PRIMARY?.withOpacity(.1),
                        ),
                        child: Image.network(
                          '${AppLinks.HOST}/${image.filename}',
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 12, bottom: 12, left: 12, right: 12),
            child: Text(
              widget.title,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          if (_showItems)
            Container(
              width: ScreenUtil.defaultSize.width,
              margin: EdgeInsets.only(bottom: 12),
              child: Text(
                widget.fullText,
              ),
            )
          else
            Container(
              width: ScreenUtil.defaultSize.width,
              margin: EdgeInsets.only(bottom: 12),
              child: Text(
                widget.introText,
              ),
            ),
          Padding(
            padding: EdgeInsets.only(top: 12, bottom: 12, left: 12, right: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.remove_red_eye_rounded,
                      size: 14,
                      color: AppColors.PRIMARY,
                    ),
                    SizedBox(width: 4),
                    Text(
                      widget.views.toString(),
                      style: TextStyle(
                        color: AppColors.PRIMARY,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                Text(
                  widget.createdAt,
                  style: TextStyle(
                    color: AppColors.BLACK.withOpacity(.5),
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
