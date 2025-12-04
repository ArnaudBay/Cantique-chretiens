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

    // Feedback haptique
    // HapticFeedback.lightImpact();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 360;

    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: isSmallScreen ? 12 : 16,
        vertical: 6,
      ),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: widget.onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white,
                Colors.green[50]!,
              ],
            ),
          ),
          child: Row(
            children: [
              // Numéro du cantique dans un cercle
              Container(
                width: isSmallScreen ? 40 : 48,
                height: isSmallScreen ? 40 : 48,
                decoration: BoxDecoration(
                  color: Colors.green[100],
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.green[300]!,
                    width: 2,
                  ),
                ),
                child: Center(
                  child: Text(
                    _song.number.toString(),
                    style: TextStyle(
                      fontSize: isSmallScreen ? 14 : 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[800],
                    ),
                  ),
                ),
              ),

              SizedBox(width: isSmallScreen ? 12 : 16),

              // Contenu principal
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Titre
                    Text(
                      _song.title,
                      style: TextStyle(
                        fontSize: isSmallScreen ? 15 : 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.green[900],
                        height: 1.3,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),

                    SizedBox(height: 4),

                    // Auteur et catégorie
                    Row(
                      children: [
                        Icon(
                          Icons.person_outline,
                          size: isSmallScreen ? 12 : 14,
                          color: Colors.grey[600],
                        ),
                        SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            _song.author,
                            style: TextStyle(
                              fontSize: isSmallScreen ? 12 : 13,
                              color: Colors.grey[600],
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 2),

                    // Catégorie
                    Row(
                      children: [
                        Icon(
                          Icons.category_outlined,
                          size: isSmallScreen ? 12 : 14,
                          color: Colors.grey[600],
                        ),
                        SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            _song.category,
                            style: TextStyle(
                              fontSize: isSmallScreen ? 11 : 12,
                              color: Colors.green[600],
                              fontWeight: FontWeight.w500,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(width: isSmallScreen ? 8 : 12),

              // Bouton favori
              _buildFavoriteButton(isSmallScreen),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFavoriteButton(bool isSmallScreen) {
    if (_isLoading) {
      return SizedBox(
        width: isSmallScreen ? 20 : 24,
        height: isSmallScreen ? 20 : 24,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.green[700]!),
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        color: _isFavorite ? Colors.red[50] : Colors.grey[100],
        shape: BoxShape.circle,
        border: Border.all(
          color: _isFavorite ? Colors.red[200]! : Colors.grey[300]!,
          width: 1,
        ),
      ),
      child: IconButton(
        icon: Icon(
          _isFavorite ? Icons.favorite : Icons.favorite_border,
          color: _isFavorite ? Colors.red : Colors.grey[600],
          size: isSmallScreen ? 18 : 20,
        ),
        padding: EdgeInsets.all(isSmallScreen ? 4 : 6),
        constraints: BoxConstraints(
          minWidth: isSmallScreen ? 32 : 40,
          minHeight: isSmallScreen ? 32 : 40,
        ),
        onPressed: _toggleFavorite,
      ),
    );
  }
}