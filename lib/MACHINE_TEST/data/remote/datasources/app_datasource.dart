import 'package:machine_test/MACHINE_TEST/core/api_provider.dart';
import 'package:machine_test/MACHINE_TEST/data/remote/models/request/login_request_modal.dart';
import 'package:machine_test/MACHINE_TEST/data/remote/models/response/feature_list_response_modal.dart';
import 'package:machine_test/MACHINE_TEST/data/remote/models/response/featured_pagination_response_modal.dart';
import 'package:machine_test/MACHINE_TEST/data/remote/models/response/login_response_modal.dart';
import 'package:machine_test/MACHINE_TEST/data/remote/remoteroutes/app_remoteroutes.dart';

abstract class AppDataSource {
  final ApiProvider apiProvider;

  AppDataSource(this.apiProvider);

  //login
  Future<LoginResponseModal> loginUser(LoginRequestModal requestModal);
  //featurecourse
  Future<FeatureCoursePaginationResponseModal> featureCourse(int skipValue);
  //featurecourseList
  Future<FeatureCourseListResponseModal> featureCourseList(
      int id, int universityId);
}

class AppDataSourceImpl extends AppDataSource {
  AppDataSourceImpl(super.apiProvider);

  @override
  Future<LoginResponseModal> loginUser(LoginRequestModal requestModal) async {
    final data = await apiProvider.post(AppRemoteRoutes.login, requestModal);
    final res = LoginResponseModal.fromJson(data);
    return res;
  }

  @override
  Future<FeatureCoursePaginationResponseModal> featureCourse(
      int skipValue) async {
    final data = await apiProvider
        .get("${AppRemoteRoutes.featureCourse}?skipValue=$skipValue");
    final res = FeatureCoursePaginationResponseModal.fromJson(data);
    return res;
  }

  @override
  Future<FeatureCourseListResponseModal> featureCourseList(
      int id, int universityId) async {
    final data = await apiProvider.get(
        "${AppRemoteRoutes.featureCourseList}?id=$id&universityId=$universityId");
    final res = FeatureCourseListResponseModal.fromJson(data);
    return res;
  }
}
