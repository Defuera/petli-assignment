import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo_display_model.freezed.dart';

@freezed
class PhotoDisplayModel with _$PhotoDisplayModel {
  const PhotoDisplayModel._();

  const factory PhotoDisplayModel({
    required int albumId,
    required int id,
    required String title,
    required String url,
    required String thumbnailUrl,
    required bool isLiked,
  }) = _PhotoDisplayModel;
}
