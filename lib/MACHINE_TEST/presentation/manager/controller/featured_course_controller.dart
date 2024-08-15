import 'package:get/get.dart';
import 'package:machine_test/MACHINE_TEST/core/response_classify.dart';
import 'package:machine_test/MACHINE_TEST/data/remote/models/response/featured_pagination_response_modal.dart';
import 'package:machine_test/MACHINE_TEST/domain/entities/featured_course_modal.dart';
import 'package:machine_test/MACHINE_TEST/domain/usecases/feature_course_usecase.dart';
import 'package:machine_test/MACHINE_TEST/presentation/manager/controller/feature_course_list_controller.dart';
import 'package:machine_test/MACHINE_TEST/presentation/pages/featured_course_list.dart';
import 'package:machine_test/MACHINE_TEST/presentation/themes/app_assets.dart';

class FeaturedCourseController extends GetxController {
  final List<FeaturedCourseModal> courselist = [
    FeaturedCourseModal(AppAssets.featurecourseimg1, "Lancaster University",
        "BSC Construction", "Management (top-up)", "London"),
    FeaturedCourseModal(AppAssets.featurecourseimg2, "Lancaster University",
        "BSC Construction", "Management (top-up)", "London"),
    FeaturedCourseModal(AppAssets.featurecourseimg2, "Lancaster University",
        "BSC Construction", "Management (top-up)", "London"),
    FeaturedCourseModal(AppAssets.featurecourseimg1, "Lancaster University",
        "BSC Construction", "Management (top-up)", "London"),
    FeaturedCourseModal(AppAssets.featurecourseimg3, "Lancaster University",
        "BSC Construction", "Management (top-up)", "London"),
    FeaturedCourseModal(AppAssets.featurecourseimg2, "Lancaster University",
        "BSC Construction", "Management (top-up)", "London"),
    FeaturedCourseModal(AppAssets.featurecourseimg2, "Lancaster University",
        "BSC Construction", "Management (top-up)", "London"),
    FeaturedCourseModal(AppAssets.featurecourseimg3, "Lancaster University",
        "BSC Construction", "Management (top-up)", "London")
  ];

  final FeatureCourseUsecase featureCourseUsecase;
  FeaturedCourseController(this.featureCourseUsecase);
  final featureListController = Get.find<FeatureCourseListController>();
  final couse = 1.obs;
  final featureCourseState =
      ResponseClassify<FeatureCoursePaginationResponseModal>.error("").obs;
  final isloading = false.obs;
  final featureCourseList = <FeatureCourseDatum>[].obs;
  getFeatureCourse() async {
    featureCourseState.value = ResponseClassify.loading();

    //try {
    featureCourseState.value = ResponseClassify.completed(
        await featureCourseUsecase.call(couse.value));
    if (couse.value == 1) {
      featureCourseList.clear();
    }

    featureCourseList.addAll(featureCourseState.value.data!.data);

    couse.value = couse.value + 1;
    isloading.value = true;
    // } catch (e) {
    featureCourseState.value = ResponseClassify.error("{e}");
  }
}
//}
