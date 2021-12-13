import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:petli_assignment/feature/common/model/error.dart';
import 'package:petli_assignment/feature/common/model/photo_display_model.dart';
import 'package:petli_assignment/feature/common/model/photos_repository.dart';

part 'photos_list_bloc.freezed.dart';

@freezed
class PhotosListState with _$PhotosListState {
  const factory PhotosListState.loading() = PhotosListStateLoading;

  const factory PhotosListState.error(RemoteError error) = PhotosListStateError;

  const factory PhotosListState.data(List<PhotoDisplayModel> photos) = PhotosListStateData;
}

class PhotosListBloc extends Cubit<PhotosListState> {
  PhotosListBloc() : super(const PhotosListState.loading());

  final _repository = GetIt.instance.get<PhotosRepository>();

  Future<void> retry() => init();

  Future<void> init() async {
    final result = await _repository.getPhotos();
    result.fold(
      (error) => emit(PhotosListState.error(error)),
      (photos) => emit(PhotosListState.data(photos)),
    );
  }

  Future<void> like(int photoId, {required bool isLiked}) async {
    await _repository.likePhoto(photoId, isLiked: isLiked);

    state.maybeWhen(data: (photos) {
      final updatedList = photos.map((photo) {
        if (photo.id == photoId) {
          return photo.copyWith(isLiked: isLiked);
        } else {
          return photo;
        }
      });

      emit(PhotosListState.data(updatedList.toList()));
    }, orElse: () {
      //do nothing
    });
  }

  Future<void> reloadLike(int photoId) async {
    final isLiked = await _repository.isLiked(photoId);
    await like(photoId, isLiked: isLiked);
  }
}
