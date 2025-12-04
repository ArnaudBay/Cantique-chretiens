import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/song.dart';

class SongsData {
  static Future<List<Song>> loadSongs() async {
    try {
      final String response = await rootBundle.loadString('assets/songs.json');
      final data = json.decode(response);

      List<Song> songs = [];
      for (var songData in data['songs']) {
        songs.add(Song.fromJson(songData));
      }

      // Trier par numéro
      songs.sort((a, b) => a.number.compareTo(b.number));
      return songs;
    } catch (e) {
      print('Erreur lors du chargement des chants: $e');
      return [];
    }
  }

  static Future<List<Song>> getSongsByCategory(String category) async {
    final allSongs = await loadSongs();
    if (category == "Tous les cantiques") {
      return allSongs;
    }
    return allSongs.where((song) => song.category == category).toList();
  }

  static Future<List<String>> getCategories() async {
    final allSongs = await loadSongs();
    final categories = allSongs.map((song) => song.category).toSet().toList();
    categories.sort();
    // Ajouter "Tous les cantiques" au début de la liste
    categories.insert(0, "Tous les cantiques");
    return categories;
  }

  static Future<Song?> getSongById(String id) async {
    final allSongs = await loadSongs();
    try {
      return allSongs.firstWhere((song) => song.id == id);
    } catch (e) {
      return null;
    }
  }

  static Future<List<Song>> searchSongs(String query) async {
    final allSongs = await loadSongs();
    final lowercaseQuery = query.toLowerCase();
    return allSongs
        .where((song) =>
            song.title.toLowerCase().contains(lowercaseQuery) ||
            song.lyrics.toLowerCase().contains(lowercaseQuery) ||
            song.author.toLowerCase().contains(lowercaseQuery))
        .toList();
  }
}
