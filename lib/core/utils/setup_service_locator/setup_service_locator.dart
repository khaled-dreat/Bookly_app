import '../../../features/search/data/data_source/srh_books_remote_data_source.dart';
import '../../../features/search/data/repo/srh_repo_emp.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../../features/home/data/data_sources/home_local_data_source.dart';
import '../../../features/home/data/data_sources/home_remote_data_source.dart';
import '../../../features/home/data/repo/home_repo_empl.dart';
import '../../api/api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocatorHome() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );
  getIt.registerSingleton<HomeRepoEmpl>(
    HomeRepoEmpl(
      homeLocalDataSource: HomeLocalDataSourceImpl(),
      homeRemoteDataSource: HomeRemoteDataSourceImpl(
        apiService: getIt.get<ApiService>(),
      ),
    ),
  );
}

void setupServiceLocatorSrh() {
  getIt.registerSingleton<SrhRepoEmpl>(SrhRepoEmpl(
      srhBooksRemoteDataSource:
          SrhBooksDataSourceImp(apiService: getIt.get<ApiService>())));
}
