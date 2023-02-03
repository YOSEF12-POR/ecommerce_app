import 'dart:convert';
import '/controller/test_controller.dart';
import '/core/class/crud.dart';
import '/core/class/handlingdataview.dart';
import '/core/constant/color.dart';
import '/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class TestView extends StatefulWidget {
  const TestView({Key? key}) : super(key: key);

  @override
  State<TestView> createState() => _TestViewState();
}

class _TestViewState extends State<TestView> {
  bool loading = true;

  getData() async {
    loading = true;

    try {
      var response = await http.post(Uri.parse(AppLink.homepage), body: {});
      var responsebody = jsonDecode(response.body);
      print(responsebody);
    } catch (e) {
      print("Error $e");
    }
    loading = false;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement
    // initState
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Get.put(TestController());
    return Scaffold(
      appBar: AppBar(
        title: loading == true
            ? Center(child: CircularProgressIndicator())
            : Text("Title"),
        backgroundColor: AppColor.primaryColor,
      ),
      body: Text("dd"),
    );
  }
}
