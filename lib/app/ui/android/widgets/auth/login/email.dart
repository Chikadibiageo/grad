import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad/app/controller/auth/login_controller.dart';

class EmailStudentIDField extends GetView<LoginController> {
  const EmailStudentIDField({
    Key? key,
    required this.c,
  }) : super(key: key);
  final c;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: Obx(
        () => TextField(
          controller: c,
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey[350]!,
              ),
              borderRadius: BorderRadius.circular(5.0),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey[350]!,
              ),
              borderRadius: BorderRadius.circular(5.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.blue[200]!,
              ),
              borderRadius: BorderRadius.circular(5.0),
            ),
            labelText: 'Email / Student ID',
            errorText:
                controller.emailerror.value ? controller.email_msg.value : null,
          ),
        ),
      ),
    );
  }
}
