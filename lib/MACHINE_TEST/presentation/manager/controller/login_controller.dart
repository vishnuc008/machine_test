import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:machine_test/MACHINE_TEST/core/response_classify.dart';
import 'package:machine_test/MACHINE_TEST/data/remote/models/request/login_request_modal.dart';
import 'package:machine_test/MACHINE_TEST/data/remote/models/response/login_response_modal.dart';
import 'package:machine_test/MACHINE_TEST/domain/usecases/login_usecase.dart';
import 'package:machine_test/MACHINE_TEST/presentation/manager/controller/featured_course_controller.dart';
import 'package:machine_test/MACHINE_TEST/presentation/routes/app_pages.dart';
import 'package:machine_test/MACHINE_TEST/presentation/widgets/custom_snackbar.dart';

class LoginController extends GetxController {

  var isChecked = false.obs;

  LoginController(this.loginUsecase);

  void checkboxFunction(bool value) {
    isChecked.value = value;
  }

  final LoginUsecase loginUsecase;
  GetStorage loginStorage = GetStorage();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final loginList = <LoginData>[].obs;
  final loginLoading = false.obs;
  final loginState = ResponseClassify<LoginResponseModal>.error("").obs;
  appLogin() async {
    loginState.value = ResponseClassify.loading();
    try {
      loginLoading.value = true;
      loginState.value = ResponseClassify.completed(await loginUsecase.call(
          LoginRequestModal(
              userField: emailController.text,
              password: passwordController.text)));
      loginList.add(loginState.value.data!.data);
      loginLoading.value = false;
      Get.toNamed(AppPages.featuredcoursepage);
      // featureCourseController.getFeatureCourse(skipValue)

    } catch (e) {
      bottomMsg("Failed", "Invalid Credentials Entered", false);
      loginState.value = ResponseClassify.error("$e");
    }
  }
}
