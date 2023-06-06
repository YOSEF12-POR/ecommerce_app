import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/view/widget/cart/buttoncart.dart';
import 'package:flutter/material.dart';

import 'custombottoncoupon.dart';

class BottomNavgationBarCart extends StatelessWidget {
  final String price;
  final String discount;
  final String totalprice;
  final TextEditingController controllercoupon;
  final void Function()? onApplyCoupon;
  const BottomNavgationBarCart(
      {Key? key,
      required this.price,
      required this.discount,
      required this.totalprice,
      required this.controllercoupon,
      this.onApplyCoupon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Expanded(
                  flex: 2,
                  child: TextFormField(
                    controller: controllercoupon,
                    decoration: InputDecoration(
                        isDense: true,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                        hintText: 'Coupon Code',
                        border: OutlineInputBorder()),
                  )),
              SizedBox(
                width: 5,
              ),
              Expanded(
                flex: 1,
                child: CustomButtonCoupon(
                  textbutton: 'apply ',
                  onPressed: onApplyCoupon,
                ),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(color: AppColor.primaryColor, width: 1),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text("price", style: TextStyle(fontSize: 16))),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text("$price \$", style: TextStyle(fontSize: 16)))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text("discount", style: TextStyle(fontSize: 16))),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child:
                          Text("$discount\$", style: TextStyle(fontSize: 16)))
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text("Total Price",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColor.primaryColor))),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text("$totalprice \$",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColor.primaryColor)))
                ],
              ),
              SizedBox(height: 10),
              CustomButtonCart(
                textbutton: "Place Order",
                onPressed: () {},
              )
            ],
          ),
        ),
      ],
    ));
  }
}
