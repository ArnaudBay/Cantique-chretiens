import 'package:shared_preferences/shared_preferences.dart';
import '../models/song.dart';

class FavoritesService {
  static final FavoritesService _instance = FavoritesService._internal();
  factory FavoritesService() => _instance;
  FavoritesService._internal();

  static const String _favoritesKey = 'favorite_songs';
  List<String> _favoriteIds = [];

  // Initialiser le service
  Future<void> init() async {
    await _loadFavorites();
  }

  // Charger les favoris depuis SharedPreferences
  Future<void> _loadFavorites() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final savedFavorites = prefs.getStringList(_favoritesKey);
      _favoriteIds = savedFavorites ?? [];
    } catch (e) {
      _favoriteIds = [];
    }
  }

  // Sauvegarder les favoris dans SharedPreferences
  Future<void> _saveFavorites() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList(_favoritesKey, _favoriteIds);
    } catch (e) {
      print('Erreur sauvegarde favoris: $e');
    }
  }

  Future<void> toggleFavorite(Song song) async {
    if (_favoriteIds.contains(song.id)) {
      _favoriteIds.remove(song.id);
    } else {
      _favoriteIds.add(song.id);
    }
    await _saveFavorites();
  }

  bool isFavorite(Song song) {
    return _favoriteIds.contains(song.id);
  }

  List<Song> getFavoriteSongs(List<Song> allSongs) {
    return allSongs.where((song) => _favoriteIds.contains(song.id)).toList();
  }

  // Vider tous les favoris (optionnel)
  Future<void> clearFavorites() async {
    _favoriteIds.clear();
    await _saveFavorites();
  }
}