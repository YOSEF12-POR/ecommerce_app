import '/controller/forgetpassword/verifycode_controller.dart';
import '/core/constant/color.dart';
import '/view/widget/auth/customtextbodyauth.dart';
import '/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VerfiyCode extends StatelessWidget {
  const VerfiyCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VerifyCodeControllerImp controller = Get.put(VerifyCodeControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text('Verification Code',
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: AppColor.grey)),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: ListView(children: [
          const SizedBox(height: 20),
          const CustomTextTitleAuth(text: "Check code"),
          const SizedBox(height: 10),
          CustomTextBodyAuth(
              text: "Please Enter The Digit Code Sent To ${controller.email}"),
          const SizedBox(height: 15),
          OtpTextField(
            fieldWidth: 50.0,
            borderRadius: BorderRadius.circular(20),
            numberOfFields: 5,
            borderColor: const Color(0xFF512DA8),
            //set to true to show as box or false to show as dash
            showFieldAsBox: true,
            //runs when a code is typed in
            onCodeChanged: (String code) {
              //handle validation or checks here
            },
            //runs when every textfield is filled
            onSubmit: (String verificationCode) {
              controller.goToResetPassword(verificationCode);
            }, // end onSubmit
          ),
          const SizedBox(height: 40),
        ]),
      ),
    );
  }
}
