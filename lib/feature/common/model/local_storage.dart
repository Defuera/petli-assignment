import 'package:shared_preferences/shared_preferences.dart';

const _isPhotoLikedKey = '_isPhotoLikedKey_';

class LocalStorage {
  LocalStorage(this._prefs);

  final SharedPreferences _prefs;

  bool isLiked(int photoId) => _prefs.get('${_isPhotoLikedKey}_$photoId') == true;

  void setLiked(int photoId, {required bool isLiked}) => _prefs.setBool('${_isPhotoLikedKey}_$photoId', isLiked);
}
