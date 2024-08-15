import 'package:machine_test/MACHINE_TEST/core/usecase.dart';
import 'package:machine_test/MACHINE_TEST/data/remote/models/response/featured_pagination_response_modal.dart';
import 'package:machine_test/MACHINE_TEST/data/repositories/app_repository.dart';

class FeatureCourseUsecase
    extends UseCase<FeatureCoursePaginationResponseModal, int> {
  final AppRepository appRepository;

  FeatureCourseUsecase(this.appRepository);

  @override
  Future<FeatureCoursePaginationResponseModal> call(int params) async {
    final data = await appRepository.featureCourse(params);
    return data;
  }
}
