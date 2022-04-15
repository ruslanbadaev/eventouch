import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../models/people.dart';
import 'controller.dart';
import 'widgets/user.dart';

class People extends StatefulWidget {
  People({Key? key}) : super(key: key);

  @override
  _PeopleState createState() => _PeopleState();
}

class _PeopleState extends State<People> with TickerProviderStateMixin {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  List<UserModel> users = [
    UserModel(
      id: "6208ed5b8afbec974dc782f4",
      name: 'Ivan Ivanov',
      email: 'Ivanov-ivan@gmail.com',
      role: 'student',
    ),
    UserModel(
      id: "6208ed5b8afbec974dc782f4",
      name: 'Petr Antonov',
      email: 'Ivanov-ivan@gmail.com',
      role: 'student',
    ),
    UserModel(
      id: "6208ed5b8afbec974dc782f4",
      name: 'Admin Petrovich',
      email: 'Ivanov-ivan@gmail.com',
      role: 'student',
    ),
    UserModel(
      id: "6208ed5b8afbec974dc782f4",
      name: 'Simple Student',
      email: 'Ivanov-ivan@gmail.com',
      role: 'student',
    ),
  ];

  initState() {
    super.initState();
  }

  int? x;
  @override
  Widget build(BuildContext context) {
    final double _screenWidth = MediaQuery.of(context).size.width;
    final double _screenHeight = MediaQuery.of(context).size.height;

    return GetBuilder<PeopleController>(
      init: PeopleController(),
      builder: (controller) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                for (UserModel user in users)
                  UserWidget(
                    id: user.id,
                    name: user.name,
                    email: user.email,
                    role: user.role,
                    onPressed: () => {
                      // _nameController.text = user.name,
                      // _emailController.text = user.email,
                      controller.selectUser(user),
                      showMaterialModalBottomSheet(
                        context: context,
                        expand: true,
                        builder: (context) => Container(
                          // height: ScreenUtil.defaultSize.height,

                          child: SingleChildScrollView(
                            child: Column(
                              // mainAxisSize: MainAxisSize.min,
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
                                    user.id,
                                    style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w700),
                                  ),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                ListTile(
                                  title: Text(
                                    'Имя:',
                                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
                                  ),
                                  subtitle: TextField(
                                    controller: _nameController,
                                  ),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                ListTile(
                                  title: Text(
                                    'Email:',
                                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
                                  ),
                                  subtitle: TextField(
                                    controller: _emailController,
                                  ),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                ListTile(
                                  title: Text(
                                    'Роль:',
                                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
                                  ),
                                  subtitle: DropdownButton(
                                    value: controller.selectedUser!.role,
                                    onChanged: (String? value) => {
                                      controller.changeUserRole(value ?? controller.selectedUser!.role),
                                      print(value),
                                    },
                                    items: [
                                      DropdownMenuItem(
                                        value: 'student',
                                        child: Text('student'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'lecturer',
                                        child: Text('lecturer'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'admin',
                                        child: Text('admin'),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 24,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Card(
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
                                    Card(
                                      child: Container(
                                        width: ScreenUtil.defaultSize.width / 2,
                                        padding: EdgeInsets.all(24),
                                        child: Text(
                                          'Удалить',
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.w700,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Card(
                                  child: InkWell(
                                    onTap: () => {
                                      Get.back(),
                                    },
                                    child: Container(
                                      width: ScreenUtil.defaultSize.width,
                                      padding: EdgeInsets.all(24),
                                      child: Text(
                                        'Сохранить',
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    },
                    descriptionWidth: _screenWidth * .5,
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
