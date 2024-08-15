import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:ionicons/ionicons.dart';
import 'package:machine_test/MACHINE_TEST/presentation/manager/controller/featured_course_controller.dart';
import 'package:machine_test/MACHINE_TEST/presentation/themes/app_colors.dart';
import 'package:machine_test/MACHINE_TEST/presentation/widgets/featured_course_widget.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';

class FeaturedCoursePage extends StatefulWidget {
  const FeaturedCoursePage({super.key});

  @override
  State<FeaturedCoursePage> createState() => _FeaturedCoursePageState();
}

final featureController = Get.find<FeaturedCourseController>();

class _FeaturedCoursePageState extends State<FeaturedCoursePage> {
  @override
  void initState() {
    featureController.getFeatureCourse();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<TabItem> tabItems = List.of([
      TabItem(
        Icons.home,
        "Home",
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        Colors.white,
      ),
      TabItem(Icons.search, "Search", Colors.orange,
          labelStyle:
              TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
      TabItem(Icons.layers, "Reports", Colors.red,
          circleStrokeColor: Colors.black),
      TabItem(Icons.notifications, "Notifications", Colors.cyan),
    ]);
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios),
          color: const Color(0xff141E3C),
        ),
        title: const Text("Featured Courses",
            style: TextStyle(
                fontFamily: "Inter",
                fontWeight: FontWeight.w700,
                fontSize: 20)),
        centerTitle: true,
        actions: [
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                  color: const Color(0xff777AAE)),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.filter_alt_outlined),
                  color: const Color(0xff777AAE))
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: h * 0.02,
            ),
            const FeaturedCouseWidget()
          ],
        ),
      ),
      bottomNavigationBar: CircularBottomNavigation(
          selectedIconColor: AppColors.darkOrange,
          barBackgroundColor: Color(0xff141E3c),
          tabItems),
    ));
  }
}
