import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import '../models/song.dart';
import '../services/favorites_service.dart';

class SongDetailScreen extends StatefulWidget {
  final Song song;

  const SongDetailScreen({super.key, required this.song});

  @override
  State<SongDetailScreen> createState() => _SongDetailScreenState();
}

class _SongDetailScreenState extends State<SongDetailScreen> {
  late Song _song;
  double _fontSize = 16.0;
  late AudioPlayer _audioPlayer;
  bool _audioLoadingError = false;
  final FavoritesService _favoritesService = FavoritesService();
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    _song = widget.song;
    _audioPlayer = AudioPlayer();
    _initAudioPlayer();
    _loadFavoriteStatus();

    // Ajout d'un logging détaillé pour le débogage
    _audioPlayer.playerStateStream.listen((state) {
      print('[AUDIO PLAYER STATE]: playing=${state.playing}, processingState=${state.processingState}');
    });
  }

  Future<void> _initAudioPlayer() async {
    if (_song.audioPath == null || _song.audioPath!.isEmpty) {
      print('[AUDIO PLAYER]: No audio path provided for this song.');
      return;
    }

    print('[AUDIO PLAYER]: Attempting to load asset: ${_song.audioPath}');
    try {
      await _audioPlayer.setAsset(_song.audioPath!);
    } catch (e) {
      print('[AUDIO PLAYER ERROR]: Failed to load audio asset. Exception: $e');
      if (mounted) {
        setState(() {
          _audioLoadingError = true;
        });
      }
    }
  }

  Future<void> _loadFavoriteStatus() async {
    await _favoritesService.init();
    if (mounted) {
      setState(() {
        _isFavorite = _favoritesService.isFavorite(_song);
      });
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
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
              _isFavorite ? Icons.favorite : Icons.favorite_border,
              color: _isFavorite ? Colors.red : Colors.white,
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
              const SizedBox(height: 16),
              Row(
                children: [
                  Icon(Icons.person, color: Colors.grey[600], size: 16),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      'Auteur: ${_song.author}',
                      style: TextStyle(
                        fontSize: _fontSize - 2,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.category, color: Colors.grey[600], size: 16),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      'Catégorie: ${_song.category}',
                      style: TextStyle(
                        fontSize: _fontSize - 2,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                ],
              ),
              if (_song.audioPath != null && _song.audioPath!.isNotEmpty) ...[
                const SizedBox(height: 16),
                const Divider(),
                const SizedBox(height: 16),
                _buildAudioPlayer(),
                const SizedBox(height: 24),
              ],
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

  Future<void> _toggleFavorite() async {
    await _favoritesService.toggleFavorite(_song);
    _loadFavoriteStatus();
  }

  Widget _buildAudioPlayer() {
    if (_audioLoadingError) {
      return const _AudioError();
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          StreamBuilder<PlayerState>(
            stream: _audioPlayer.playerStateStream,
            builder: (context, snapshot) {
              final playerState = snapshot.data;
              final processingState = playerState?.processingState;
              final playing = playerState?.playing;

              if (processingState == ProcessingState.loading ||
                  processingState == ProcessingState.buffering) {
                return const CircularProgressIndicator();
              } else if (playing != true) {
                return IconButton(
                  icon: const Icon(Icons.play_arrow, color: Colors.green),
                  iconSize: 48.0,
                  onPressed: () {
                    print('[ACTION]: Play button pressed.');
                    try {
                      _audioPlayer.play();
                    } catch (e) {
                      print('[ERROR] Failed to play audio: $e');
                    }
                  },
                );
              } else if (processingState != ProcessingState.completed) {
                return IconButton(
                  icon: const Icon(Icons.pause, color: Colors.green),
                  iconSize: 48.0,
                  onPressed: () {
                    print('[ACTION]: Pause button pressed.');
                    _audioPlayer.pause();
                  },
                );
              } else {
                return IconButton(
                  icon: const Icon(Icons.replay, color: Colors.green),
                  iconSize: 48.0,
                  onPressed: () {
                    print('[ACTION]: Replay button pressed.');
                    _audioPlayer.seek(Duration.zero);
                  },
                );
              }
            },
          ),
          StreamBuilder<Duration?>(
            stream: _audioPlayer.durationStream,
            builder: (context, snapshot) {
              final duration = snapshot.data ?? Duration.zero;
              return StreamBuilder<Duration>(
                stream: _audioPlayer.positionStream,
                builder: (context, snapshot) {
                  var position = snapshot.data ?? Duration.zero;
                  if (position > duration) {
                    position = duration;
                  }
                  return Slider(
                    value: position.inMilliseconds.toDouble(),
                    onChanged: (value) {
                      _audioPlayer.seek(Duration(milliseconds: value.toInt()));
                    },
                    min: 0.0,
                    max: duration.inMilliseconds.toDouble(),
                    activeColor: Colors.green,
                    inactiveColor: Colors.grey[400],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class _AudioError extends StatelessWidget {
  const _AudioError();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.red[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, color: Colors.red[700]),
            const SizedBox(width: 16),
            Text(
              'Fichier audio introuvable',
              style: TextStyle(color: Colors.red[700]),
            ),
          ],
        ));
  }
}
