import 'package:flutter/material.dart';
import '../models/song.dart';
import '../widgets/song_card.dart';
import 'song_detail_screen.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Song> songs;

  const FavoritesScreen({super.key, required this.songs});

  @override
  Widget build(BuildContext context) {
    final favoriteSongs = songs.where((song) => song.isFavorite).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mes Cantiques Favoris'),
        backgroundColor: Colors.green[700],
        foregroundColor: Colors.white,
      ),
      body: favoriteSongs.isEmpty
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.favorite_border,
              size: 64,
              color: Colors.green[400],
            ),
            const SizedBox(height: 16),
            Text(
              'Aucun cantique favori',
              style: TextStyle(
                fontSize: 18,
                color: Colors.green[600],
              ),
            ),
          ],
        ),
      )
          : ListView.builder(
        itemCount: favoriteSongs.length,
        itemBuilder: (context, index) {
          final song = favoriteSongs[index];
          return SongCard(
            song: song,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SongDetailScreen(song: song),
                ),
              );
            },
          );
        },
      ),
    );
  }
}