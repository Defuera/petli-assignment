import 'package:get_it/get_it.dart';
import 'package:petli_assignment/feature/common/model/local_storage.dart';
import 'package:petli_assignment/feature/common/model/network/http_client.dart';
import 'package:petli_assignment/feature/common/model/network/photos_api.dart';
import 'package:petli_assignment/feature/common/model/photos_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Base url can be configured on CI, for simplicity hardcoding it here
const _baseUrl = 'https://jsonplaceholder.typicode.com';

class DiModule {
  static Future<void> setup() async {
    final getIt = GetIt.instance;
    final sharedPreferences = await SharedPreferences.getInstance();

    getIt
      ..registerSingleton(HttpClient(baseUrl: _baseUrl))
      ..registerSingleton(PhotosApi(getIt.get()))
      ..registerSingleton(LocalStorage(sharedPreferences))
      ..registerSingleton(PhotosRepository(getIt.get(), getIt.get()));

    await getIt.allReady();
  }
}
