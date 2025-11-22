import 'package:flutter/material.dart';
import '../models/song.dart';

class SongDetailScreen extends StatefulWidget {
  final Song song;

  const SongDetailScreen({super.key, required this.song});

  @override
  State<SongDetailScreen> createState() => _SongDetailScreenState();
}

class _SongDetailScreenState extends State<SongDetailScreen> {
  late Song _song;
  double _fontSize = 16.0;

  @override
  void initState() {
    super.initState();
    _song = widget.song;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cantique ${_song.number}'),
        backgroundColor: Colors.green[700],
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(
              _song.isFavorite ? Icons.favorite : Icons.favorite_border,
              color: _song.isFavorite ? Colors.red : Colors.white,
            ),
            onPressed: _toggleFavorite,
          ),
          PopupMenuButton<double>(
            icon: const Icon(Icons.text_fields, color: Colors.white),
            onSelected: (size) {
              setState(() {
                _fontSize = size;
              });
            },
            itemBuilder: (context) => [
              const PopupMenuItem(value: 14.0, child: Text('Petite police')),
              const PopupMenuItem(value: 16.0, child: Text('Police moyenne')),
              const PopupMenuItem(value: 18.0, child: Text('Grande police')),
              const PopupMenuItem(value: 20.0, child: Text('Très grande police')),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _song.title,
                style: TextStyle(
                  fontSize: _fontSize + 4,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[700],
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Auteur: ${_song.author}',
                style: TextStyle(
                  fontSize: _fontSize - 2,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green[50],
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.green[100]!),
                ),
                child: Text(
                  _song.lyrics,
                  style: TextStyle(fontSize: _fontSize),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _toggleFavorite() {
    setState(() {
      _song = _song.copyWith(isFavorite: !_song.isFavorite);
    });
  }
}