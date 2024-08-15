import 'package:get/get.dart';
import 'package:machine_test/MACHINE_TEST/presentation/manager/controller/feature_course_list_controller.dart';
import 'package:machine_test/injector.dart';

class FeatureCourseListControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FeatureCourseListController(getIt()));
  }
}
