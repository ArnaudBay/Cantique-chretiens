import 'package:flutter/material.dart';
import '../models/song.dart';
import '../services/favorites_service.dart';

class SongCard extends StatefulWidget {
  final Song song;
  final VoidCallback onTap;

  const SongCard({
    super.key,
    required this.song,
    required this.onTap,
  });

  @override
  State<SongCard> createState() => _SongCardState();
}

class _SongCardState extends State<SongCard> {
  late Song _song;
  final FavoritesService _favoritesService = FavoritesService();

  @override
  void initState() {
    super.initState();
    _song = widget.song;
  }

  void _toggleFavorite() {
    setState(() {
      _favoritesService.toggleFavorite(_song);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      elevation: 2,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.green[100],
          child: Text(
            _song.number.toString(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.green[700],
            ),
          ),
        ),
        title: Text(
          _song.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          'Cantique ${_song.number} - ${_song.author}',
          style: TextStyle(color: Colors.grey[600]),
        ),
        trailing: IconButton(
          icon: Icon(
            _favoritesService.isFavorite(_song)
                ? Icons.favorite
                : Icons.favorite_border,
            color: _favoritesService.isFavorite(_song)
                ? Colors.red
                : Colors.grey,
          ),
          onPressed: _toggleFavorite,
        ),
        onTap: widget.onTap,
      ),
    );
  }
}