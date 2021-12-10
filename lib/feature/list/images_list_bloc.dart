import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:petli_assignment/feature/common/model/error.dart';
import 'package:petli_assignment/feature/common/model/photo_model.dart';
import 'package:petli_assignment/feature/common/model/photos_repository.dart';

part 'images_list_bloc.freezed.dart';

@freezed
class ImagesListState with _$ImagesListState {
  const factory ImagesListState.loading() = ImagesListStateLoading;

  const factory ImagesListState.error(RemoteError error) = ImagesListStateError;

  const factory ImagesListState.data(List<PhotoModel> photos) = ImagesListStateData;
}

class ImagesListBloc extends Cubit<ImagesListState> {
  ImagesListBloc() : super(const ImagesListState.loading());

  final _repository = GetIt.instance.get<PhotosRepository>();

  Future<void> retry() => init();

  Future<void> init() async {
    final result = await _repository.getPhotos();
    result.fold(
      (error) => emit(ImagesListState.error(error)),
      (photos) => emit(ImagesListState.data(photos)),
    );
  }
}
