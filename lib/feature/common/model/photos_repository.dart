import 'package:either_option/either_option.dart';
import 'package:petli_assignment/feature/common/model/error.dart';
import 'package:petli_assignment/feature/common/model/network/photos_api.dart';
import 'package:petli_assignment/feature/common/model/photo_model.dart';

class PhotosRepository {
  PhotosRepository(this._api);

  final PhotosApi _api;

  Future<Either<RemoteError, List<PhotoModel>>> getPhotos() => _api.getPhotos();
}
