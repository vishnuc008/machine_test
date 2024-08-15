import 'package:get/get.dart';
import 'package:machine_test/MACHINE_TEST/presentation/manager/controller/featured_course_controller.dart';
import 'package:machine_test/injector.dart';

class FeaturedCourseControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FeaturedCourseController(getIt()));
  }
}
