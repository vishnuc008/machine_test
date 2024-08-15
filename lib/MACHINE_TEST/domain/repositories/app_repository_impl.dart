import 'package:machine_test/MACHINE_TEST/data/remote/datasources/app_datasource.dart';
import 'package:machine_test/MACHINE_TEST/data/remote/models/request/login_request_modal.dart';
import 'package:machine_test/MACHINE_TEST/data/remote/models/response/feature_list_response_modal.dart';
import 'package:machine_test/MACHINE_TEST/data/remote/models/response/featured_pagination_response_modal.dart';
import 'package:machine_test/MACHINE_TEST/data/remote/models/response/login_response_modal.dart';
import 'package:machine_test/MACHINE_TEST/data/repositories/app_repository.dart';

class AppRepositoryImpl extends AppRepository {
  final AppDataSource appDataSource;

  AppRepositoryImpl(this.appDataSource);

  @override
  Future<LoginResponseModal> loginUser(LoginRequestModal requestModal) async {
    final data = await appDataSource.loginUser(requestModal);
    return data;
  }

  @override
  Future<FeatureCoursePaginationResponseModal> featureCourse(
      int skipValue) async {
    final data = await appDataSource.featureCourse(skipValue);
    return data;
  }

  @override
  Future<FeatureCourseListResponseModal> featureCourseList(
      int id, int universityId) async {
    final data = await appDataSource.featureCourseList(id, universityId);
    return data;
  }
}
