import '../models/song.dart';

class FavoritesService {
  static final FavoritesService _instance = FavoritesService._internal();
  factory FavoritesService() => _instance;
  FavoritesService._internal();

  final List<String> _favoriteIds = [];

  void toggleFavorite(Song song) {
    if (_favoriteIds.contains(song.id)) {
      _favoriteIds.remove(song.id);
    } else {
      _favoriteIds.add(song.id);
    }
  }

  bool isFavorite(Song song) {
    return _favoriteIds.contains(song.id);
  }

  List<Song> getFavoriteSongs(List<Song> allSongs) {
    return allSongs.where((song) => _favoriteIds.contains(song.id)).toList();
  }
}