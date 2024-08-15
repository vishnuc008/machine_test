import 'package:get/utils.dart';
import 'package:get_it/get_it.dart';
import 'package:machine_test/MACHINE_TEST/core/api_provider.dart';
import 'package:machine_test/MACHINE_TEST/data/remote/datasources/app_datasource.dart';
import 'package:machine_test/MACHINE_TEST/data/repositories/app_repository.dart';
import 'package:machine_test/MACHINE_TEST/domain/repositories/app_repository_impl.dart';
import 'package:machine_test/MACHINE_TEST/domain/usecases/feature_course_list_usecase.dart';
import 'package:machine_test/MACHINE_TEST/domain/usecases/feature_course_usecase.dart';
import 'package:machine_test/MACHINE_TEST/domain/usecases/login_usecase.dart';

final getIt = GetIt.instance;
Future<void> setUp() async {
  getIt.registerSingleton<ApiProvider>(ApiProvider());
  getIt.registerLazySingleton<AppRepository>(() => AppRepositoryImpl(getIt()));
  getIt.registerLazySingleton<AppDataSource>(() => AppDataSourceImpl(getIt()));
  getIt.registerLazySingleton<LoginUsecase>(() => LoginUsecase(getIt()));
  getIt.registerLazySingleton<FeatureCourseUsecase>(
      () => FeatureCourseUsecase(getIt()));
  getIt.registerLazySingleton(() => FeatureCourseListUsecase(getIt()));
}
