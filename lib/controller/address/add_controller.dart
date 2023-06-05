import 'dart:async';

import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/constant/routes.dart';

class AddAddressController extends GetxController {
  StatusRequest statusRequest = StatusRequest.loading;
  Completer<GoogleMapController>? completercontroller;
  List<Marker> markers = [];
  double? lat;
  double? long;
  addMarkers(LatLng latLng) {
    markers.clear();
    markers.add(Marker(markerId: MarkerId("1"), position: latLng));
    lat = latLng.latitude;
    long = latLng.longitude;
    print('lat >>  $lat  /// long >> $long ');
    update();
  }

  goToPageAddDetailsAddress() {
    Get.toNamed(AppRoute.addressaddetails,
        arguments: {"lat": lat.toString(), "long": long.toString()});
  }

  Position? position;
  CameraPosition? kGooglePlex;

  getCurrentLocation() async {
    position = await Geolocator.getCurrentPosition();
    kGooglePlex = CameraPosition(
      target: LatLng(position!.latitude, position!.longitude),
      zoom: 14.4746,
    );
    statusRequest = StatusRequest.none;
    update();
  }

  @override
  void onInit() {
    getCurrentLocation();
    completercontroller = Completer<GoogleMapController>();
    super.onInit();
  }
}
