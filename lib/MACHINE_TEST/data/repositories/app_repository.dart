import 'package:machine_test/MACHINE_TEST/data/remote/models/request/login_request_modal.dart';
import 'package:machine_test/MACHINE_TEST/data/remote/models/response/feature_list_response_modal.dart';
import 'package:machine_test/MACHINE_TEST/data/remote/models/response/featured_pagination_response_modal.dart';
import 'package:machine_test/MACHINE_TEST/data/remote/models/response/login_response_modal.dart';

abstract class AppRepository {
  Future<LoginResponseModal> loginUser(LoginRequestModal requestModal);
  Future<FeatureCoursePaginationResponseModal> featureCourse(int skipValue);
  Future<FeatureCourseListResponseModal> featureCourseList(int id, int universityId);
}
