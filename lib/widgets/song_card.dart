import 'package:flutter/material.dart';
import '../models/song.dart';

class SongCard extends StatelessWidget {
  final Song song;
  final VoidCallback onTap;

  const SongCard({
    super.key,
    required this.song,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      elevation: 2,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.green[100],
          child: Text(
            song.number.toString(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.green[700],
            ),
          ),
        ),
        title: Text(
          song.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          'Cantique ${song.number} - ${song.author}',
          style: TextStyle(color: Colors.grey[600]),
        ),
        trailing: Icon(
          song.isFavorite ? Icons.favorite : Icons.favorite_border,
          color: song.isFavorite ? Colors.red : Colors.grey,
        ),
        onTap: onTap,
      ),
    );
  }
}