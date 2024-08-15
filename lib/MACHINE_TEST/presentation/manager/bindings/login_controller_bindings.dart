import 'package:get/get.dart';
import 'package:machine_test/MACHINE_TEST/presentation/manager/controller/login_controller.dart';
import 'package:machine_test/injector.dart';

class LoginControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(getIt()));
  }
}
