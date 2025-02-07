import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:grad/app/core/functions/functions.dart';
import 'package:grad/app/ui/android/widgets/staffs/non-teachers.dart';
import 'package:grad/app/ui/android/widgets/staffs/teachers.dart';

class Staffs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Tab> _tab = staffsTabbar();
    return DefaultTabController(
      initialIndex: 0,
      length: _tab.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Staffs"),
          elevation: 0,
          backgroundColor: Theme.of(context).primaryColorDark,
          bottom: TabBar(
            isScrollable: false,
            tabs: _tab,
          ),
        ),
        body: TabBarView(
          children: [
            ///
            ///Teachers
            ///
            Teachers(),

            ///
            ///Non teachers
            ///
            NonTeachers(),
          ],
        ),
        // floatingActionButton: _buildFloatActionButton(),
      ),
    );
  }

  Widget _buildFloatActionButton() {
    return FloatingActionButton(
      backgroundColor: Colors.white,
      onPressed: () => Get.toNamed("/staffs/add"),
      child: Icon(
        FeatherIcons.plus,
        color: Color(0xFF21B7CA),
      ),
    );
  }
}
