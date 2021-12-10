import 'package:get_it/get_it.dart';
import 'package:petli_assignment/feature/common/model/network/http_client.dart';
import 'package:petli_assignment/feature/common/model/network/photos_api.dart';
import 'package:petli_assignment/feature/common/model/photos_repository.dart';

// Base url can be configured on CI, for simplicity hardcoding it here
const _baseUrl = 'https://jsonplaceholder.typicode.com';

class DiModule {
  static Future<void> setup() async {
    final getIt = GetIt.instance;

    getIt
      ..registerSingleton(HttpClient(baseUrl: _baseUrl))
      ..registerSingleton(PhotosApi(getIt.get()))
      ..registerSingleton(PhotosRepository(getIt.get()));

    await getIt.allReady();
  }
}
