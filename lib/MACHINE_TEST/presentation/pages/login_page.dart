import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:ionicons/ionicons.dart';
import 'package:machine_test/MACHINE_TEST/presentation/manager/controller/featured_course_controller.dart';
import 'package:machine_test/MACHINE_TEST/presentation/manager/controller/login_controller.dart';
import 'package:machine_test/MACHINE_TEST/presentation/routes/app_pages.dart';
import 'package:machine_test/MACHINE_TEST/presentation/themes/app_assets.dart';
import 'package:machine_test/MACHINE_TEST/presentation/themes/app_colors.dart';
import 'package:machine_test/MACHINE_TEST/presentation/widgets/custom_snackbar.dart';
import 'package:machine_test/MACHINE_TEST/presentation/widgets/custom_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

final logincontroller = Get.find<LoginController>();

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(w * 0.05),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: h * 0.07,
                  ),
                  const Text(
                    "Start With",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: AppColors.textColor,
                        fontSize: 27),
                  ),
                  const Text(
                    "Lilac Infotech",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: AppColors.black,
                        fontSize: 40),
                  ),
                  const Text("Enter your mobile number",
                      style: TextStyle(
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w400,
                          color: Color(0xff777AAE),
                          fontSize: 14)),
                  SizedBox(
                    height: h * 0.13,
                  ),
                  CustomTextField(
                    hintText: "Email/ Phone Number",
                    controller: logincontroller.emailController,
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  CustomTextField(
                    hintText: "Password",
                    passwordfield: true,
                    controller: logincontroller.passwordController,
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Obx(() => Checkbox(
                              value: logincontroller.isChecked.value,
                              onChanged: (bool? value) {
                                logincontroller
                                    .checkboxFunction(value ?? false);
                              })),
                          const Text("Remember Me",
                              style: TextStyle(
                                  fontFamily: "Inter",
                                  color: Color(0xff141E3C),
                                  fontSize: 12))
                        ],
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const Text("Forgot Password?"))
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        w * 0.02, h * 0.02, w * 0.02, h * 0.03),
                    child: SizedBox(
                      height: h * 0.07,
                      width: w,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.buttonColor),
                          onPressed: () {
                            if (logincontroller
                                    .emailController.text.isNotEmpty &&
                                logincontroller
                                    .passwordController.text.isNotEmpty) {
                              logincontroller.appLogin();
                            } else {
                              bottomMsg(
                                  "Failed", "Please Fill All Fields", false);
                            }
                          },
                          child: const Text("Login",
                              style: TextStyle(
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16))),
                    ),
                  ),
                  const Center(child: Text("Signup with")),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                          w * 0.02, h * 0.02, w * 0.02, h * 0.03),
                      child: SizedBox(
                        height: h * 0.07,
                        width: w,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side: const BorderSide(
                                  color: Color.fromARGB(255, 214, 213, 213),
                                  width: 1.5),
                            ),
                          ),
                          onPressed: () {},
                          icon: Brand(Brands.google),
                          label: const Text("Google",
                              style: TextStyle(
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromARGB(255, 156, 154, 154),
                                  fontSize: 16)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: h * 0.05),
                  const Center(
                      child: Text("By signing up, you agree to our",
                          style: TextStyle(
                              fontFamily: "Inter",
                              color: Color(0xff141E3C),
                              fontSize: 12))),
                  Center(
                    child: RichText(
                        text: const TextSpan(children: [
                      TextSpan(
                          text: "Terms & Conditions",
                          style: TextStyle(
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w700,
                              color: Color(0xffFF1B6F),
                              fontSize: 12)),
                      TextSpan(
                          text: "  and",
                          style: TextStyle(
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w700,
                              color: Color(0xff141E3C),
                              fontSize: 12)),
                      TextSpan(
                          text: "  Privacy policy",
                          style: TextStyle(
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w700,
                              color: Color(0xffFF1B6F),
                              fontSize: 12))
                    ])),
                  )
                ],
              ),
            ),
            Positioned(
                right: -6,
                top: h * 0.06,
                child: Container(
                  height: h * 0.25,
                  width: w * 0.37,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(AppAssets.loginLogo),
                          fit: BoxFit.fill)),
                ))
          ],
        ),
      ),
    ));
  }
}
