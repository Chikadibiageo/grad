import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/state_manager.dart';
import 'package:grad/app/controller/home/home_controller.dart';
import 'package:grad/app/core/functions/functions.dart';
import 'package:grad/app/ui/android/widgets/custom/cached_network_image.dart';

class NonTeachers extends GetView<HomeController> {
  const NonTeachers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<dynamic> users = controller.non_teaching;
    if (users.isEmpty) return Container();
    return Container(
      margin: EdgeInsets.only(
        left: 5,
        right: 5,
        top: 10,
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        elevation: 0,
        child: Container(
          padding: EdgeInsets.only(
            left: 10,
            right: 10,
            top: 10,
            bottom: 10,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Non teachers".toUpperCase(),
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  Text(
                    "See All".toUpperCase(),
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ],
              ),
              Divider(),
              ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) => Divider(),
                itemCount: users.length,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Row(children: [
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            ClipOval(
                              child: CustomNetworkImage(
                                ht: 40,
                                url: "${users[index]['avatar']}",
                                wd: 40,
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${users[index]['first_name']} ${users[index]['last_name']} ${users[index]['middle_name']}",
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    "${users[index]['email']}",
                                    maxLines: 1,
                                    style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "${users[index]['user_role']['name']}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () async {
                                  await createChannel(context,
                                      "${chatStreamId(controller.school.value, users[index]['id'])}");
                                },
                                child: Container(
                                  child: Icon(
                                    FeatherIcons.messageCircle,
                                    color: Theme.of(context).iconTheme.color,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
