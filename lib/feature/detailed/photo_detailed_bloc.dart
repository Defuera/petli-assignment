import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:petli_assignment/feature/common/model/photo_display_model.dart';
import 'package:petli_assignment/feature/common/model/photos_repository.dart';

part 'photo_detailed_bloc.freezed.dart';

@freezed
class PhotoDetailedState with _$PhotoDetailedState {
  const factory PhotoDetailedState(PhotoDisplayModel photoModel) = PhotoDetailedStateData;
}

class PhotoDetailedBloc extends Cubit<PhotoDetailedState> {
  PhotoDetailedBloc(PhotoDisplayModel photoModel) : super(PhotoDetailedState(photoModel));

  final _repository = GetIt.instance.get<PhotosRepository>();

  Future<void> like(int photoId, {required bool isLiked}) async {
    await _repository.likePhoto(photoId, isLiked: isLiked);
    emit(PhotoDetailedState(state.photoModel.copyWith(isLiked: isLiked)));
  }
}
