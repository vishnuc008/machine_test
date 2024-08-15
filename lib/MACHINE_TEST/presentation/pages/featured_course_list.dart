import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:machine_test/MACHINE_TEST/data/remote/models/response/feature_list_response_modal.dart';
import 'package:machine_test/MACHINE_TEST/presentation/routes/app_pages.dart';
import 'package:machine_test/MACHINE_TEST/presentation/themes/app_assets.dart';
import 'package:machine_test/MACHINE_TEST/presentation/themes/app_colors.dart';

class FeaturedCourseList extends StatelessWidget {
  const FeaturedCourseList({
    super.key,
    required this.modal,
  });
  final FeatureCourseListDatum? modal;

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              Container(
                height: h * 0.27,
                width: w,
                child: (modal?.logoImage == null || modal!.logoImage!.isEmpty)
                    ? Image.asset(
                        AppAssets.featurecourseimg1,
                        fit: BoxFit.cover,
                      )
                    : Image.network(
                        modal!.logoImage!,
                        fit: BoxFit.fill,
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          return Image.asset(AppAssets.featurecourseimg1);
                        },
                      ),
              ),
              Positioned(
                  top: h * 0.02,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            w * 0.09, h * 0.03, w * 0.03, 0),
                        child: Row(
                          children: [
                            Container(
                              height: h * 0.08,
                              width: w * 0.09,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.white,
                                  width: 2.0,
                                ),
                              ),
                              child: IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: Padding(
                                    padding: EdgeInsets.only(left: w * 0.009),
                                    child: const Icon(
                                      Icons.arrow_back_ios,
                                      color: AppColors.white,
                                      size: 20,
                                    ),
                                  )),
                            ),
                            SizedBox(
                              width: w * 0.52,
                            ),
                            Container(
                              height: h * 0.08,
                              width: w * 0.09,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.white),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: const Center(
                                      child: Icon(
                                    Icons.favorite_border_outlined,
                                    size: 21,
                                  ))),
                            ),
                            SizedBox(
                              width: w * 0.02,
                            ),
                            Container(
                              height: h * 0.08,
                              width: w * 0.09,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.white),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.share,
                                    size: 20,
                                  )),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: h * 0.1,
                      ),
                      Row(
                        children: [
                          Container(
                            height: h * 0.025,
                            width: w * 0.025,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: AppColors.white),
                          ),
                          SizedBox(
                            width: w * 0.01,
                          ),
                          Container(
                            height: h * 0.025,
                            width: w * 0.025,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(255, 71, 71, 72)),
                          ),
                          SizedBox(
                            width: w * 0.01,
                          ),
                          Container(
                            height: h * 0.025,
                            width: w * 0.025,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: AppColors.white),
                          )
                        ],
                      )
                    ],
                  ))
            ]),
            Padding(
              padding:
                  EdgeInsets.fromLTRB(w * 0.03, h * 0.015, w * 0.01, h * 0.01),
              child: Text(
                modal!.courseDescription!,
                style: TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 18),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.fromLTRB(w * 0.03, h * 0.01, w * 0.01, h * 0.01),
              child: Row(
                children: [
                  const Icon(
                    Icons.home,
                    color: Color(0xff141E3C),
                  ),
                  SizedBox(
                    width: w * 0.02,
                  ),
                  Text(
                    modal!.universityName!,
                    style: TextStyle(color: Color(0xff777AAE)),
                  )
                ],
              ),
            ),
            SizedBox(
              height: h * 0.05,
            ),
            Padding(
              padding:
                  EdgeInsets.fromLTRB(w * 0.03, h * 0.01, w * 0.01, h * 0.01),
              child: Text(modal!.courseDescription!),
            ),
            const Divider(
              color: AppColors.greyText,
              height: 30,
              thickness: 1,
              indent: 15,
              endIndent: 0,
            ),
            Padding(
              padding:
                  EdgeInsets.fromLTRB(w * 0.03, h * 0.00, w * 0.01, h * 0.01),
              child: Row(
                children: [
                  Container(
                    height: h * 0.06,
                    width: w * 0.06,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffFF1B6F),
                    ),
                    child: const Icon(
                      Icons.check_rounded,
                      color: AppColors.white,
                      size: 18,
                    ),
                  ),
                  SizedBox(
                    width: w * 0.03,
                  ),
                  const Text(
                    "Eligibility",
                    style: TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  )
                ],
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.fromLTRB(w * 0.03, h * 0.00, w * 0.01, h * 0.01),
              child: Container(
                height: h * 0.07,
                width: w * 0.93,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: const Color(0xffF6F6F6),
                ),
                child: Center(
                    child: Text(
                  modal!.courseEligible!.toString() ?? "No Data",
                  style: TextStyle(
                      color: AppColors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 17),
                )),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.fromLTRB(w * 0.03, h * 0.01, w * 0.01, h * 0.01),
              child: Container(
                height: h * 0.07,
                width: w * 0.93,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: const Color(0xffF6F6F6),
                ),
                child: const Center(
                    child: Text(
                  "HSE",
                  style: TextStyle(
                      color: AppColors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 17),
                )),
              ),
            ),
            const Divider(
              color: AppColors.greyText,
              height: 30,
              thickness: 1,
              indent: 15,
              endIndent: 0,
            ),
            Padding(
              padding:
                  EdgeInsets.fromLTRB(w * 0.03, h * 0.00, w * 0.01, h * 0.01),
              child: Row(
                children: [
                  Container(
                    height: h * 0.06,
                    width: w * 0.06,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffFF1B6F),
                    ),
                    child: const Icon(
                      Icons.check_rounded,
                      color: AppColors.white,
                      size: 18,
                    ),
                  ),
                  SizedBox(
                    width: w * 0.03,
                  ),
                  const Text(
                    "Course Duration",
                    style: TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  )
                ],
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.fromLTRB(w * 0.03, h * 0.01, w * 0.01, h * 0.01),
              child: Container(
                height: h * 0.07,
                width: w * 0.93,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: const Color(0xffF6F6F6),
                ),
                child: Center(
                    child: Text(
                  modal!.courseDuration!,
                  style: TextStyle(
                      color: AppColors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 17),
                )),
              ),
            ),
            const Divider(
              color: AppColors.greyText,
              height: 30,
              thickness: 1,
              indent: 15,
              endIndent: 0,
            ),
            Padding(
              padding:
                  EdgeInsets.fromLTRB(w * 0.03, h * 0.00, w * 0.01, h * 0.01),
              child: Row(
                children: [
                  Container(
                    height: h * 0.06,
                    width: w * 0.06,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffFF1B6F),
                    ),
                    child: const Icon(
                      Icons.currency_yen_outlined,
                      color: AppColors.white,
                      size: 18,
                    ),
                  ),
                  SizedBox(
                    width: w * 0.03,
                  ),
                  const Text(
                    "Course Intakes",
                    style: TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  )
                ],
              ),
            ),
            modal!.courseIntaks!.isNotEmpty
                ? Padding(
                    padding: EdgeInsets.fromLTRB(
                        w * 0.03, h * 0.01, w * 0.01, h * 0.01),
                    child: Container(
                      height: h * 0.07,
                      width: w * 0.93,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: const Color(0xffF6F6F6),
                      ),
                      child: Center(
                          child: Text(
                        modal!.courseIntaks!.first.intakeDate.isNotEmpty
                            ? modal!.courseIntaks!.first.intakeDate
                            : "no data found",
                        style: TextStyle(
                            color: AppColors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 17),
                      )),
                    ),
                  )
                : Text("no data found"),
            const Divider(
              color: AppColors.greyText,
              height: 30,
              thickness: 1,
              indent: 15,
              endIndent: 0,
            ),
            Padding(
              padding:
                  EdgeInsets.fromLTRB(w * 0.03, h * 0.00, w * 0.01, h * 0.01),
              child: Row(
                children: [
                  Container(
                    height: h * 0.06,
                    width: w * 0.06,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffFF1B6F),
                    ),
                    child: const Icon(
                      Icons.business,
                      color: AppColors.white,
                      size: 17,
                    ),
                  ),
                  SizedBox(
                    width: w * 0.03,
                  ),
                  const Text(
                    "University",
                    style: TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  )
                ],
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.fromLTRB(w * 0.03, h * 0.00, w * 0.01, h * 0.01),
              child: Text(modal!.universityName!,
                  style: TextStyle(
                      color: Color(0xff777AAE),
                      fontWeight: FontWeight.w700,
                      fontSize: 18)),
            ),
            Padding(
              padding:
                  EdgeInsets.fromLTRB(w * 0.03, h * 0.01, w * 0.01, h * 0.01),
              child: Text(modal!.aboutUniversity!),
            ),
            Padding(
              padding:
                  EdgeInsets.fromLTRB(w * 0.03, h * 0.01, w * 0.01, h * 0.01),
              child: Row(
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    color: Color(0xff141E3C),
                  ),
                  SizedBox(
                    width: w * 0.02,
                  ),
                  Text(
                    modal!.universityCountry!,
                    style: TextStyle(color: Color(0xff777AAE)),
                  )
                ],
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.fromLTRB(w * 0.03, h * 0.01, w * 0.01, h * 0.01),
              child: Row(
                children: [
                  const Icon(
                    Icons.grade,
                    color: Color(0xff141E3C),
                  ),
                  SizedBox(
                    width: w * 0.02,
                  ),
                  Text(
                    modal!.universityRank!,
                    style: TextStyle(color: Color(0xff777AAE)),
                  )
                ],
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.fromLTRB(w * 0.03, h * 0.01, w * 0.01, h * 0.01),
              child: Container(
                height: h * 0.07,
                width: w * 0.93,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: const Color(0xffF6F6F6),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        height: h * 0.06,
                        width: w * 0.075,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff777AAE),
                        ),
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.download,
                              color: AppColors.white,
                              size: 16,
                            ))),
                    SizedBox(
                      width: w * 0.03,
                    ),
                    const Text(
                      "Download University Brochure",
                      style: TextStyle(
                          color: AppColors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 18),
                    )
                  ],
                ),
              ),
            ),
            const Divider(
              color: AppColors.greyText,
              height: 30,
              thickness: 1,
              indent: 15,
              endIndent: 0,
            ),
            Padding(
              padding:
                  EdgeInsets.fromLTRB(w * 0.03, h * 0.00, w * 0.01, h * 0.01),
              child: Row(
                children: [
                  Container(
                    height: h * 0.06,
                    width: w * 0.06,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffFF1B6F),
                    ),
                    child: const Icon(
                      Icons.menu_book,
                      color: AppColors.white,
                      size: 16,
                    ),
                  ),
                  SizedBox(
                    width: w * 0.03,
                  ),
                  const Text(
                    "Course Syllabus",
                    style: TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  )
                ],
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.fromLTRB(w * 0.03, h * 0.01, w * 0.01, h * 0.01),
              child: Text(modal!.courseDescription!),
            ),
            Padding(
              padding:
                  EdgeInsets.fromLTRB(w * 0.03, h * 0.01, w * 0.01, h * 0.01),
              child: Container(
                height: h * 0.07,
                width: w * 0.93,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: const Color(0xffF6F6F6),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        height: h * 0.06,
                        width: w * 0.075,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff777AAE),
                        ),
                        child: IconButton(
                            onPressed: () {
                              modal!.courseSyllabusPdf;
                            },
                            icon: const Icon(
                              Icons.download,
                              color: AppColors.white,
                              size: 16,
                            ))),
                    SizedBox(
                      width: w * 0.03,
                    ),
                    const Text(
                      "Download Course Syllabus",
                      style: TextStyle(
                          color: AppColors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 18),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.fromLTRB(w * 0.03, h * 0.00, w * 0.01, h * 0.01),
              child: Row(
                children: [
                  Container(
                    height: h * 0.06,
                    width: w * 0.06,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffFF1B6F),
                    ),
                    child: const Icon(
                      Icons.monetization_on_outlined,
                      color: AppColors.white,
                      size: 16,
                    ),
                  ),
                  SizedBox(
                    width: w * 0.03,
                  ),
                  const Text(
                    "Placement",
                    style: TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  )
                ],
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.fromLTRB(w * 0.03, h * 0.00, w * 0.01, h * 0.01),
              child: Text(modal!.universityName!,
                  style: TextStyle(
                      color: Color.fromARGB(255, 122, 123, 125),
                      fontWeight: FontWeight.w700,
                      fontSize: 18)),
            ),
            Padding(
              padding:
                  EdgeInsets.fromLTRB(w * 0.03, h * 0.01, w * 0.01, h * 0.01),
              child: Text(modal!.placement!),
            ),
            const Divider(
              color: AppColors.greyText,
              height: 30,
              thickness: 1,
              indent: 15,
              endIndent: 0,
            ),
            Padding(
              padding:
                  EdgeInsets.fromLTRB(w * 0.03, h * 0.00, w * 0.01, h * 0.01),
              child: Row(
                children: [
                  Container(
                    height: h * 0.06,
                    width: w * 0.06,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffFF1B6F),
                    ),
                    child: const Icon(
                      Icons.monetization_on_outlined,
                      color: AppColors.white,
                      size: 16,
                    ),
                  ),
                  SizedBox(
                    width: w * 0.03,
                  ),
                  const Text(
                    "Total Fee",
                    style: TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  )
                ],
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.fromLTRB(w * 0.03, h * 0.00, w * 0.01, h * 0.01),
              child: Container(
                height: h * 0.22,
                width: w,
                decoration: BoxDecoration(
                    color: const Color(0xffF6F6F6),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: h * 0.02,
                                ),
                                const Text(
                                  "Term",
                                  style: TextStyle(
                                      color: Color(0xff777AAE),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17),
                                ),
                                const Text("First Year"),
                                const Text("Second Year"),
                                const Text("Third Year")
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: h * 0.02,
                                ),
                                const Text(
                                  "Fee",
                                  style: TextStyle(
                                      color: Color(0xff777AAE),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17),
                                ),
                                const Text("50000"),
                                const Text(" 50000"),
                                const Text("50000"),
                              ],
                            ),
                          ],
                        ),
                        const Divider(
                          color: AppColors.greyText,
                          height: 30,
                          thickness: 1,
                          indent: 15,
                          endIndent: 0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Total",
                              style: TextStyle(
                                  color: Color(0xffFF1B6F),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17),
                            ),
                            Text("₹${ modal!.totalFee!}",
                              style: TextStyle(
                                  color: Color(0xffFF1B6F),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17),
                            )
                          ],
                        )
                      ],
                    )),
              ),
            ),
            const Divider(
              color: AppColors.greyText,
              height: 30,
              thickness: 1,
              indent: 15,
              endIndent: 0,
            ),
            Padding(
              padding:
                  EdgeInsets.fromLTRB(w * 0.03, h * 0.00, w * 0.01, h * 0.01),
              child: Row(
                children: [
                  Container(
                    height: h * 0.06,
                    width: w * 0.06,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffFF1B6F),
                    ),
                    child: const Icon(
                      Icons.dock_outlined,
                      color: AppColors.white,
                      size: 16,
                    ),
                  ),
                  SizedBox(
                    width: w * 0.03,
                  ),
                  const Text(
                    "Documents Required",
                    style: TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  )
                ],
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.fromLTRB(w * 0.03, h * 0.00, w * 0.01, h * 0.01),
              child: Container(
                height: h * 0.15,
                width: w,
                decoration: BoxDecoration(
                    color: const Color(0xffF6F6F6),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: h * 0.02,
                      ),
                      modal!.documentRequired == null
                          ? Text("No data found")
                          : Text(modal!.documentRequired),
                     
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.fromLTRB(w * 0.02, h * 0.02, w * 0.02, h * 0.03),
              child: SizedBox(
                height: h * 0.07,
                width: w,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.buttonColor),
                    onPressed: () {
                      Get.toNamed(AppPages.featuredcoursepage);
                    },
                    child: const Text("Get Admission",
                        style: TextStyle(
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w700,
                            fontSize: 16))),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
