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
  bool _isFavorite = false;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _song = widget.song;
    _loadFavoriteStatus();
  }

  Future<void> _loadFavoriteStatus() async {
    setState(() {
      _isLoading = true;
    });

    // S'assurer que le service est initialisé
    await _favoritesService.init();

    setState(() {
      _isFavorite = _favoritesService.isFavorite(_song);
      _isLoading = false;
    });
  }

  Future<void> _toggleFavorite() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
    });

    await _favoritesService.toggleFavorite(_song);

    setState(() {
      _isFavorite = _favoritesService.isFavorite(_song);
      _isLoading = false;
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
        trailing: _isLoading
            ? SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.green[700]!),
          ),
        )
            : IconButton(
          icon: Icon(
            _isFavorite ? Icons.favorite : Icons.favorite_border,
            color: _isFavorite ? Colors.red : Colors.grey,
          ),
          onPressed: _toggleFavorite,
        ),
        onTap: widget.onTap,
      ),
    );
  }
}