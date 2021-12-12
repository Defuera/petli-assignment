import 'package:json_annotation/json_annotation.dart';

part 'photo_api_model.g.dart';

@JsonSerializable()
class PhotoApiModel {
  PhotoApiModel(
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
  );

  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  factory PhotoApiModel.fromJson(Map<String, dynamic> json) => _$PhotoApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoApiModelToJson(this);
}
