import 'package:flutter/material.dart';
import '../models/song.dart';
import '../widgets/song_card.dart';
import '../services/favorites_service.dart';
import 'song_detail_screen.dart';

class FavoritesScreen extends StatefulWidget {
  final List<Song> songs;

  const FavoritesScreen({super.key, required this.songs});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final FavoritesService _favoritesService = FavoritesService();
  List<Song> _favoriteSongs = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    await _favoritesService.init();
    setState(() {
      _favoriteSongs = _favoritesService.getFavoriteSongs(widget.songs);
      _isLoading = false;
    });
  }

  Future<void> _refreshFavorites() async {
    setState(() {
      _isLoading = true;
    });
    await _loadFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mes Cantiques Favoris'),
        backgroundColor: Colors.green[700],
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _refreshFavorites,
          ),
        ],
      ),
      body: _isLoading
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : RefreshIndicator(
        onRefresh: _refreshFavorites,
        child: _favoriteSongs.isEmpty
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
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  'Ajoutez des favoris en cliquant sur l\'icône ♡ dans la liste des cantiques',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        )
            : ListView.builder(
          itemCount: _favoriteSongs.length,
          itemBuilder: (context, index) {
            final song = _favoriteSongs[index];
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
      ),
    );
  }
}