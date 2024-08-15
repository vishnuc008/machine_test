import 'package:get/get.dart';
import 'package:machine_test/MACHINE_TEST/core/response_classify.dart';
import 'package:machine_test/MACHINE_TEST/data/remote/models/response/feature_list_response_modal.dart';
import 'package:machine_test/MACHINE_TEST/domain/usecases/feature_course_list_usecase.dart';
import 'package:machine_test/MACHINE_TEST/presentation/pages/featured_course_list.dart';
import 'package:machine_test/MACHINE_TEST/presentation/routes/app_pages.dart';

class FeatureCourseListController extends GetxController {
  final FeatureCourseListUsecase featureCourseListUsecase;

  FeatureCourseListController(this.featureCourseListUsecase);
  final featureCourseListState =
      ResponseClassify<FeatureCourseListResponseModal>.error("").obs;
  final isloading = false.obs;
  final featureCourseData = <FeatureCourseListDatum?>[].obs;
  getFeatureCourseList(int id, int universityId) async {
    print("id=$id");
    print("universityId=$universityId");
    featureCourseListState.value = ResponseClassify.loading();
    //try {
    featureCourseListState.value = ResponseClassify.completed(
        await featureCourseListUsecase.call(id & universityId));
    featureCourseData.addAll([featureCourseListState.value.data!.data]);
    // Get.toNamed(AppPages.featurecourselist);
    Get.to(FeaturedCourseList(modal: featureCourseData.first));

    isloading.value = true;
    // } catch (e) {
    featureCourseListState.value = ResponseClassify.error("{e}");
  }
}
//}
