import 'package:either_option/either_option.dart';
import 'package:petli_assignment/feature/common/model/error.dart';
import 'package:petli_assignment/feature/common/model/local_storage.dart';
import 'package:petli_assignment/feature/common/model/model_extensions.dart';
import 'package:petli_assignment/feature/common/model/network/photos_api.dart';
import 'package:petli_assignment/feature/common/model/network/utils.dart';
import 'package:petli_assignment/feature/common/model/photo_display_model.dart';

class PhotosRepository {
  PhotosRepository(this._api, this.storage);

  final PhotosApi _api;
  final LocalStorage storage;

  Future<Either<RemoteError, List<PhotoDisplayModel>>> getPhotos() async {
    final result = await _api.getPhotos();
    return result.mapRightAsync(
      (models) async => models.map((photo) => photo.toDisplayModel(isLiked: storage.isLiked(photo.id))).toList(),
    );
  }

  Future<void> likePhoto(int photoId, {required bool isLiked}) async {
    storage.setLiked(photoId, isLiked: isLiked);
  }
}
