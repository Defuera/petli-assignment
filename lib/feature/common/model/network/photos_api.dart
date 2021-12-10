import 'package:either_option/either_option.dart';
import 'package:petli_assignment/feature/common/model/error.dart';
import 'package:petli_assignment/feature/common/model/network/http_client.dart';
import 'package:petli_assignment/feature/common/model/network/utils.dart';
import 'package:petli_assignment/feature/common/model/photo_model.dart';

class PhotosApi {
  PhotosApi(this.client);

  final HttpClient client;

  final _photosEndpoint = '/photos';

  Future<Either<RemoteError, List<PhotoModel>>> getPhotos() async => executeSafely<List<dynamic>, List<PhotoModel>>(
        client.getJson<List<dynamic>>(_photosEndpoint),
        (json) => json.map((dynamic element) => PhotoModel.fromJson(element as Map<String, dynamic>)).toList(),
      );
}
