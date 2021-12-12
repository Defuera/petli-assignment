import 'package:petli_assignment/feature/common/model/network/photo_api_model.dart';
import 'package:petli_assignment/feature/common/model/photo_display_model.dart';

extension PhotoApiModelExtension on PhotoApiModel {
  PhotoDisplayModel toDisplayModel({bool isLiked = false}) => PhotoDisplayModel(
        albumId: albumId,
        id: id,
        title: title,
        url: url,
        thumbnailUrl: thumbnailUrl,
        isLiked: isLiked,
      );
}
