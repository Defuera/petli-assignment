import 'package:either_option/either_option.dart';
import 'package:petli_assignment/feature/common/model/error.dart';
import 'package:petli_assignment/feature/common/model/network/http_client.dart';
import 'package:petli_assignment/feature/common/model/network/photo_api_model.dart';
import 'package:petli_assignment/feature/common/model/network/utils.dart';

class PhotosApi {
  PhotosApi(this.client);

  final HttpClient client;

  final _photosEndpoint = '/photos';

  Future<Either<RemoteError, List<PhotoApiModel>>> getPhotos() async =>
      executeSafely<List<dynamic>, List<PhotoApiModel>>(
        client.getJson<List<dynamic>>(_photosEndpoint),
        (json) => json.map((dynamic element) => PhotoApiModel.fromJson(element as Map<String, dynamic>)).toList(),
      );
}
