import 'package:get/get.dart';
import 'package:machine_test/MACHINE_TEST/presentation/manager/bindings/feature_course_list_binding.dart';
import 'package:machine_test/MACHINE_TEST/presentation/manager/bindings/featured_course_controller_binding.dart';
import 'package:machine_test/MACHINE_TEST/presentation/manager/bindings/login_controller_bindings.dart';
import 'package:machine_test/MACHINE_TEST/presentation/pages/featured_course_list.dart';
import 'package:machine_test/MACHINE_TEST/presentation/pages/featured_course_page.dart';
import 'package:machine_test/MACHINE_TEST/presentation/pages/login_page.dart';
import 'package:machine_test/MACHINE_TEST/presentation/routes/app_pages.dart';
import 'package:machine_test/injector.dart';

class AppRoutes {
  static List<GetPage> routes = [
  GetPage(name: AppPages.loginpage, page: ()=> const LoginPage(),binding: LoginControllerBindings()),
  GetPage(name: AppPages.featuredcoursepage, page: ()=> const FeaturedCoursePage(),bindings: [FeaturedCourseControllerBinding(),FeatureCourseListControllerBinding()]),
 
  ];
}
