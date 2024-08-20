import 'package:ecommerc2/core/class/AppRouting.dart';
import 'package:ecommerc2/core/class/middleware.dart';
import 'package:ecommerc2/view/screan/AfterRegister/check%20out/CheckOut_view.dart';
import 'package:ecommerc2/view/screan/AfterRegister/home/HomeScrean_view.dart';
import 'package:ecommerc2/view/screan/AfterRegister/items/Items_View.dart';
import 'package:ecommerc2/view/screan/AfterRegister/address/Addaddress.dart';
import 'package:ecommerc2/view/screan/AfterRegister/address/Address_view.dart';
import 'package:ecommerc2/view/screan/AfterRegister/cart/Mycart_view.dart';
import 'package:ecommerc2/view/screan/AfterRegister/order/Orders_view.dart';
import 'package:ecommerc2/view/screan/AfterRegister/orderdetails/orderdetails_view.dart';
import 'package:ecommerc2/view/screan/AfterRegister/productdetails/productdetails.dart';
import 'package:ecommerc2/view/screan/AplicationSign/congratulationpage.dart';
import 'package:ecommerc2/view/screan/AplicationSign/register_view.dart';
import 'package:ecommerc2/view/screan/AplicationSign/signup_view.dart';
import 'package:ecommerc2/view/screan/AplicationSign/verificationcode_view.dart';
import 'package:ecommerc2/view/screan/StartApplication/ChooseLangauge.dart';
import 'package:ecommerc2/view/screan/StartApplication/Onboarding_view.dart';
import 'package:ecommerc2/view/screan/forgetpassword/ForgetPassword_view.dart';
import 'package:ecommerc2/view/screan/forgetpassword/verifycode_forget.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage<dynamic>>? getPages = [
  GetPage(name: AppRouting.signup, page: () => const Signup_view()),
  GetPage(name: AppRouting.homescrean, page: () => const HomeScrean_view()),
  GetPage(name: "/", page: () => const ChooseLangauge_view(), middlewares: [
    Middle(),
  ]),
  GetPage(
      name: AppRouting.forgetpassword, page: () => const ForgetPassword_view()),
  GetPage(
    name: AppRouting.onboarding,
    page: () => const Onboarding_view(),
  ),
  GetPage(name: AppRouting.register, page: () => const Register_view()),
  GetPage(
      name: AppRouting.verifycationcode,
      page: () => const Verificationcode_view()),
  GetPage(
      name: AppRouting.verifycationcode_forget,
      page: () => const Verifycode_forget_view()),
  GetPage(name: AppRouting.Items, page: () => const Items_view()),
  GetPage(
      name: AppRouting.Productdetails, page: () => const ProductDetais_view()),
  GetPage(
      name: AppRouting.congratulation, page: () => const Congratulation_view()),
  GetPage(name: AppRouting.mycart, page: () => const Mycart_view()),
  GetPage(name: AppRouting.address, page: () => const Address_view()),
  GetPage(name: AppRouting.addaddress, page: () => const Addaddress_view()),
  GetPage(name: AppRouting.checkout, page: () => const Checkout_view()),
  GetPage(name: AppRouting.order, page: () => const Orders_view()),
  GetPage(name: AppRouting.orderdetails, page: () => const Orderdetails_view()),
];
