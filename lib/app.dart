import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:machine_test/MACHINE_TEST/presentation/routes/app_pages.dart';
import 'package:machine_test/MACHINE_TEST/presentation/routes/app_routes.dart';
import 'package:machine_test/MACHINE_TEST/presentation/themes/app_themes.dart';
import 'package:machine_test/MACHINE_TEST/presentation/widgets/custom_alert_dialog.dart';



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        customAlertDialogue(
          title: "Exit!",
          content: "Are you Sure You Want to Exit",
          txtbutton1Action: () {
            exit(0);
          },
          txtbutton2Action: () {
            Get.back();
          },
          txtbuttonName1: "Yes",
          txtbuttonName2: "No",
        );
      },
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppPages.loginpage,
        theme: AppTheme.lightTheme,
        getPages: AppRoutes.routes,
      ),
    );
  }
}
