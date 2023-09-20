import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/imgaeasset.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../controller/settings_controller.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController());
    return Container(
      child: ListView(
        children: [
          Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(height: Get.width / 3, color: AppColor.primaryColor),
                Positioned(
                    top: Get.width / 3.9,
                    child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100)),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.grey[100],
                        backgroundImage: AssetImage(AppImageAsset.avatar),
                      ),
                    )),
              ]),
          SizedBox(height: 100),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Card(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                ListTile(
                  // onTap: () {},
                  trailing: Switch(onChanged: (val) {}, value: true),
                  title: Text("Disable Notificatios"),
                ),
                ListTile(
                  onTap: () {
                    Get.toNamed(AppRoute.addressview);
                  },
                  trailing: Icon(Icons.location_on_outlined),
                  title: Text("Address"),
                ),
                ListTile(
                  onTap: () {
                    Get.toNamed(AppRoute.orderspending);
                  },
                  trailing: Icon(Icons.store),
                  title: Text("Orders_Pending"),
                ),
                ListTile(
                  onTap: () {},
                  trailing: Icon(Icons.archive),
                  title: Text("Orders_Archive"),
                ),
                ListTile(
                  onTap: () {},
                  trailing: Icon(Icons.help_outline_rounded),
                  title: Text("About us"),
                ),
                ListTile(
                  onTap: () {},
                  trailing: Icon(Icons.phone_callback_outlined),
                  title: Text("Contact us"),
                ),
                ListTile(
                  onTap: () {
                    controller.logout();
                  },
                  title: Text("Logout"),
                  trailing: Icon(Icons.exit_to_app),
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
