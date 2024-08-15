import 'package:machine_test/MACHINE_TEST/core/usecase.dart';
import 'package:machine_test/MACHINE_TEST/data/remote/models/response/feature_list_response_modal.dart';
import 'package:machine_test/MACHINE_TEST/data/repositories/app_repository.dart';

class FeatureCourseListUsecase
    extends UseCase<FeatureCourseListResponseModal, int> {
  final AppRepository appRepository;

  FeatureCourseListUsecase(this.appRepository);

  @override
  Future<FeatureCourseListResponseModal> call(int params) async {
    final data = await appRepository.featureCourseList(params, params);
    return data;
  }
}
