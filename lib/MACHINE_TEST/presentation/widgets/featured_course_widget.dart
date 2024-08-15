import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:machine_test/MACHINE_TEST/data/remote/models/response/featured_pagination_response_modal.dart';
import 'package:machine_test/MACHINE_TEST/domain/entities/featured_course_modal.dart';
import 'package:machine_test/MACHINE_TEST/presentation/manager/controller/feature_course_list_controller.dart';
import 'package:machine_test/MACHINE_TEST/presentation/manager/controller/featured_course_controller.dart';
import 'package:machine_test/MACHINE_TEST/presentation/themes/app_assets.dart';
import 'package:machine_test/MACHINE_TEST/presentation/themes/app_colors.dart';

class FeaturedCouseWidget extends StatefulWidget {
  const FeaturedCouseWidget({super.key});

  @override
  State<FeaturedCouseWidget> createState() => _FeaturedCouseWidgetState();
}

final featuredCourseController = Get.find<FeaturedCourseController>();

class _FeaturedCouseWidgetState extends State<FeaturedCouseWidget> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => featuredCourseController.isloading.value == false
          ? Center(child: CircularProgressIndicator())
          : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 1.6),
              ),
              itemCount: featuredCourseController.featureCourseList.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return FeaturedCourseItem(
                    modal: featuredCourseController
                        .featureCourseList.value[index]);
              },
            ),
    );
  }
}

class FeaturedCourseItem extends StatelessWidget {
  FeaturedCourseItem({super.key, required this.modal});
  final FeatureCourseDatum modal;
  final featureListController = Get.find<FeatureCourseListController>();
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: GestureDetector(
        onTap: () {
          featureListController.getFeatureCourseList(
              modal.courseId, modal.universityId);
        },
        child: Card(
          child: Container(
            decoration: const BoxDecoration(color: AppColors.white),
            child: Column(children: [
              Stack(children: [
                Container(
                    height: h * 0.14,
                    width: w * 0.5,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      image: DecorationImage(
                          image: NetworkImage(modal.images.isNotEmpty
                              ? modal.images.first
                              : "https://lh6.googleusercontent.com/Bu-pRqU_tWZV7O3rJ5nV1P6NjqFnnAs8kVLC5VGz_Kf7ws0nDUXoGTc7pP87tyUCfu8VyXi0YviIm7CxAISDr2lJSwWwXQxxz98qxVfMcKTJfLPqbcfhn-QEeOowjrlwX1LYDFJN"),
                          fit: BoxFit.cover),
                    )),
                Positioned(
                    top: h * 0.095,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: h * 0.03,
                            width: w * 0.23,
                            decoration: BoxDecoration(
                                color: AppColors.offWhite,
                                borderRadius: BorderRadius.circular(15)),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.location_on_outlined,
                                  size: 18,
                                ),
                                Expanded(
                                  child: Text(
                                    overflow: TextOverflow.ellipsis,
                                    modal.country.toString(),
                                    style: TextStyle(
                                        color: Color(0xff777AAE), fontSize: 13),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: w * 0.04,
                          ),
                          Container(
                              height: h * 0.03,
                              width: w * 0.15,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: AppColors.offWhite),
                              child: const Center(
                                  child: Text(
                                "₹500000",
                                style: TextStyle(
                                    color: Color(0xff777AAE), fontSize: 13),
                              ))),
                        ],
                      ),
                    ))
              ]),
              SizedBox(
                height: h * 0.02,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.home,
                    color: Color(0xff141E3C),
                  ),
                  SizedBox(
                    width: w * 0.02,
                  ),
                  SizedBox(
                    width: w * 0.35,
                    child: Text(
                      modal.universityName.toString(),
                      style: const TextStyle(color: Color(0xff777AAE)),
                    ),
                  )
                ],
              ),
              Text(
                modal.courseTitle,
                style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    color: AppColors.black,
                    fontSize: 16),
              ),
              // Text(
              //   modal.courseFee.toString(),
              //   style: const TextStyle(
              //       fontWeight: FontWeight.w700,
              //       color: AppColors.black,
              //       fontSize: 16),
              // ),
              // Text(
              //   modal.sub2,
              //   style: const TextStyle(
              //       fontWeight: FontWeight.w700,
              //       color: AppColors.black,
              //       fontSize: 16),
              // )
            ]),
          ),
        ),
      ),
    );
  }
}
