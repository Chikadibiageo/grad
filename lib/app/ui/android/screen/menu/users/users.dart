import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:grad/app/controller/menu/users_controller.dart';
import 'package:grad/app/core/functions/functions.dart';
import 'package:grad/app/ui/android/widgets/custom/cached_network_image.dart';

class Users extends GetView<UsersController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(name: "Users"),
      body: Obx(
        () {
          if (controller.loading.value)
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          var data = controller.users;

          if (data.length == 0)
            return Center(
              child: Text("No Users"),
            );
          return Container(
            child: ListView(
              shrinkWrap: true,
              children: [
                for (var i = 0; i < data.length; i++)
                  _buildSlideAble(
                    data[i],
                    context,
                  ),
              ],
            ),
          );
        },
      ),
      // floatingActionButton: _buildFloatActionButton(),
    );
  }

  Widget _buildSlideAble(
    data,
    context,
  ) {
    return Column(
      children: [
        Slidable(
          // Specify a key if the Slidable is dismissible.
          key: ValueKey(data['id']),
          // The start action pane is the one at the left or the top side.
          startActionPane: ActionPane(
            // A motion is a widget used to control how the pane animates.
            motion: const ScrollMotion(),

            // All actions are defined in the children parameter.
            children: [
              // A SlidableAction can have an icon and/or a label.
              SlidableAction(
                onPressed: (_) async =>
                    null, // showDeleteDialog(context, data['id']),
                foregroundColor: Color.fromARGB(255, 120, 120, 120),
                icon: FeatherIcons.trash,
                label: 'Delete',
              ),
              SlidableAction(
                onPressed: (_) => null, //Get.toNamed(
                // "/users/edit",
                // arguments: data,
                // ),
                foregroundColor: Color.fromARGB(255, 125, 124, 124),
                icon: FeatherIcons.edit,
                label: 'Edit',
              ),
            ],
          ),

          // The child of the Slidable is what the user sees when the
          // component is not dragged.
          child: ListTile(
            onTap: () => Get.toNamed(
              "/users/view",
              arguments: data,
            ),
            leading: ClipOval(
              child: CustomNetworkImage(
                url: "${data['avatar']}",
              ),
            ),
            title: Text(
              "${data['first_name']} ${data['last_name']} ${data['middle_name'] ?? ""}",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              "${data['email']}",
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            // trailing: userStatusIcon("${data['status']}"),
            trailing: GestureDetector(
              onTap: () async {
                await createChannel(context,
                    "${chatStreamId(controller.school.value, data['id'])}");
              },
              child: Container(
                child: Icon(
                  FeatherIcons.messageCircle,
                  color: Theme.of(context).iconTheme.color,
                ),
              ),
            ),
          ),
        ),
        Divider(),
      ],
    );
  }

  Widget _buildFloatActionButton() {
    return FloatingActionButton(
      backgroundColor: Colors.white,
      onPressed: () => Get.toNamed("/users/add"),
      child: Icon(
        FeatherIcons.plus,
        color: Color(0xFF21B7CA),
      ),
    );
  }

  ///
  /// Delete pop up
  ///

  showDeleteDialog(BuildContext context, id) {
    ///
    ///No button
    ///
    Widget nobutton = TextButton(
      child: Text("No"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    ///
    /// yes button
    ///
    Widget yesButton = TextButton(
      child: Text("Yes"),
      onPressed: () async {
        Navigator.pop(context);
        await controller.deleteUser(id: id, type: "admin");
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Delete User"),
      content: Text("Are you sure you want to delete this user?"),
      actions: [
        nobutton,
        yesButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
