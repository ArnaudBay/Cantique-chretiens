import 'package:flutter/material.dart';
import '../models/song.dart';
import '../widgets/song_card.dart';
import 'song_detail_screen.dart';

class SongListScreen extends StatelessWidget {
  final List<Song> songs;
  final String category;

  const SongListScreen({
    super.key,
    required this.songs,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cantiques - $category'),
        backgroundColor: Colors.green[700],
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: songs.length,
        itemBuilder: (context, index) {
          final song = songs[index];
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