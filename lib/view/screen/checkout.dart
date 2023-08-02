import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/imgaeasset.dart';
import 'package:ecommerce_app/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Checkout extends StatelessWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CheckOut'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Container(
          child: ListView(
            children: [
              Text(
                "Choose Payment Method",
                style: TextStyle(
                    color: AppColor.secondColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                    color: AppColor.secondColor,
                    borderRadius: BorderRadius.circular(20)),
                child: const Text(
                  "Cash ",
                  style: TextStyle(
                      color: Colors.white,
                      height: 1,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                    color: AppColor.thirdColor,
                    borderRadius: BorderRadius.circular(20)),
                child: const Text(
                  "Payment Cards ",
                  style: TextStyle(
                      color: AppColor.secondColor,
                      height: 1,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Choose Delivery Type",
                style: TextStyle(
                    color: AppColor.secondColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              Row(
                children: [
                  Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                        color: AppColor.secondColor,
                        border: Border.all(color: AppColor.secondColor)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AppImageAsset.delivery,
                          width: 60,
                          color: Colors.white,
                        ),
                        Text(
                          "Delivery",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,

                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                        // color: Colors.white,
                        border: Border.all(color: AppColor.secondColor)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AppImageAsset.delivery_truck,
                          width: 60,
                        ),
                        Text(
                          "Delivery Truck",
                          style: TextStyle(
                            color: AppColor.secondColor,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
