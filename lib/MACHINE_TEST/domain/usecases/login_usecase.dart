import 'package:machine_test/MACHINE_TEST/core/usecase.dart';
import 'package:machine_test/MACHINE_TEST/data/remote/models/request/login_request_modal.dart';
import 'package:machine_test/MACHINE_TEST/data/remote/models/response/login_response_modal.dart';
import 'package:machine_test/MACHINE_TEST/data/repositories/app_repository.dart';

class LoginUsecase extends UseCase<LoginResponseModal, LoginRequestModal> {
  final AppRepository appRepository;

  LoginUsecase(this.appRepository);

  @override
  Future<LoginResponseModal> call(LoginRequestModal params) async {
    final data = await appRepository.loginUser(params);
    return data;
  }
}
