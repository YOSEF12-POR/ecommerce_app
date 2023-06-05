import 'package:ecommerce_app/controller/address/add_controller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/view/widget/auth/custombuttonauth.dart';
import 'package:ecommerce_app/view/widget/home/custombottomappbarhome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/class/handlingdataview.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AddAddressController controllerpage = Get.put(AddAddressController());
    return Scaffold(
      appBar: AppBar(title: const Text('Add New Address ')),
      body: Container(
        child: GetBuilder<AddAddressController>(
            builder: ((controllerpage) => HandlingDataView(
                statusRequest: controllerpage.statusRequest,
                widget: Column(
                  children: [
                    if (controllerpage.kGooglePlex != null)
                      Expanded(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            GoogleMap(
                              mapType: MapType.normal,
                              markers: controllerpage.markers.toSet(),
                              onTap: (Latlong) {
                                controllerpage.addMarkers(Latlong);
                              },
                              initialCameraPosition:
                                  controllerpage.kGooglePlex!,
                              onMapCreated:
                                  (GoogleMapController controllermap) {
                                controllerpage.completercontroller!
                                    .complete(controllermap);
                              },
                            ),
                            Positioned(
                                bottom: 10,
                                child: Container(
                                    child: MaterialButton(
                                  minWidth: 200,
                                  onPressed: () {
                                    controllerpage.goToPageAddDetailsAddress();
                                  },
                                  child: Text(
                                    'تاكيد',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  color: AppColor.primaryColor,
                                  textColor: Colors.white,
                                )))
                          ],
                        ),
                      ),
                  ],
                )))),
      ),
    );
  }
}
