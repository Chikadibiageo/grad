import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:grad/app/controller/menu/users_controller.dart';
import 'package:grad/app/ui/android/widgets/staffs/t-list.dart';

class Teachers extends GetView<UsersController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.loading.value)
        return Container(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      var data = controller.teachers;
      return Container(
        child: ListView(
          shrinkWrap: true,
          children: [
            for (var i = 0; i < data.length; i++)
              TList(
                data: data[i],
                type: "teacher",
              ),
          ],
        ),
      );
    });
  }
}
