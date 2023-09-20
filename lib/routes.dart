import 'package:ecommerce_app/view/address/add.dart';
import 'package:ecommerce_app/view/address/view.dart';
import 'package:ecommerce_app/view/screen/cart.dart';
import 'package:ecommerce_app/view/screen/checkout.dart';
import 'package:ecommerce_app/view/screen/orders/pending.dart';

import '/core/constant/routes.dart';
import '/core/middleware/mymiddleware.dart';
import '/view/screen/auth/forgetpassword/forgetpassword.dart';
import '/view/screen/auth/login.dart';
import '/view/screen/auth/forgetpassword/resetpassword.dart';
import '/view/screen/auth/signup.dart';
import '/view/screen/auth/forgetpassword/success_resetpassword.dart';
import '/view/screen/auth/success_signup.dart';
import '/view/screen/auth/forgetpassword/verifycode.dart';
import '/view/screen/auth/verifycodesignup.dart';
import '/view/screen/homescreen.dart';
import '/view/screen/items.dart';
import '/view/screen/language.dart';
import '/view/screen/myfavorite.dart';
import '/view/screen/onboarding.dart';
import '/view/screen/productdetails.dart';
import 'package:get/get.dart';

import 'view/address/adddetails.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/", page: () => const Language(), middlewares: [MyMiddleWare()]),
  // GetPage(name: "/", page: () => Cart()),
//  Auth
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verfiyCode, page: () => const VerfiyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoute.successResetpassword,
      page: () => const SuccessResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),
  GetPage(
      name: AppRoute.verfiyCodeSignUp, page: () => const VerfiyCodeSignUp()),
  //
  GetPage(name: AppRoute.homepage, page: () => const HomeScreen()),
  GetPage(name: AppRoute.items, page: () => const Items()),
  GetPage(name: AppRoute.productdetails, page: () => const ProductDetails()),
  GetPage(name: AppRoute.myfavroite, page: () => const MyFavorite()),
  GetPage(name: AppRoute.myfavroite, page: () => const MyFavorite()),
  GetPage(name: AppRoute.cart, page: () => const Cart()),

  GetPage(name: AppRoute.addressview, page: () => const AddressView()),
  GetPage(name: AppRoute.addressadd, page: () => const AddressAdd()),
  GetPage(
      name: AppRoute.addressaddetails, page: () => const AddressAddDetails()),
  GetPage(name: AppRoute.checkout, page: () => const Checkout()),
  GetPage(name: AppRoute.orderspending, page: () => const OrdersPending()),
];
