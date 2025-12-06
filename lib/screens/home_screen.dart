import 'package:flutter/material.dart';
import '../widgets/category_card.dart';
import '../models/song.dart';
import 'song_list_screen.dart';
import 'favorites_screen.dart';
import 'search_screen.dart';
import 'about_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<Song> songs;

  const HomeScreen({super.key, required this.songs});

  @override
  Widget build(BuildContext context) {
    final categories = _getCategories();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Recueil des Cantiques'),
        backgroundColor: Colors.green[700],
        elevation: 0,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchScreen(songs: songs),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.favorite, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoritesScreen(songs: songs),
                ),
              );
            },
          ),
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onSelected: (value) {
              if (value == 'about') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AboutScreen(),
                  ),
                );
              }
            },
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem<String>(
                value: 'about',
                child: Row(
                  children: [
                    Icon(Icons.info, color: Colors.green),
                    SizedBox(width: 8),
                    Text('À Propos'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.green[700]!,
              Colors.green[500]!,
              Colors.white,
            ],
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: const Text(
                'Cantiques Chrétiens',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: categories.isEmpty
                      ? const Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.music_note,
                                size: 64,
                                color: Colors.grey,
                              ),
                              SizedBox(height: 16),
                              Text(
                                'Aucun cantique disponible',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        )
                      : GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                            childAspectRatio: 1.2,
                          ),
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            final category = categories.keys.elementAt(index);
                            return CategoryCard(
                              category: category,
                              songCount: categories[category]!,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SongListScreen(
                                      songs: songs
                                          .where((song) =>
                                              song.category == category)
                                          .toList(),
                                      category: category,
                                    ),
                                  ),
                                );
                              },
                              iconPath: _getCategoryIconPath(category),
                            );
                          },
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Map<String, int> _getCategories() {
    final categories = <String, int>{};
    for (var song in songs) {
      categories[song.category] = (categories[song.category] ?? 0) + 1;
    }
    return categories;
  }

  String _getCategoryIconPath(String category) {
    switch (category.toLowerCase()) {
      case 'évangélisation & salut':
        return 'assets/icons/eglise.png';
      case 'dangers spirituels':
        return 'assets/icons/danger.png';
      case 'bible':
        return 'assets/icons/bible.png';
      case 'eglise':
        return 'assets/icons/eglise.png';
      case 'combat spirituel':
        return 'assets/icons/combat.png';
      case 'ethique chrétienne':
        return 'assets/icons/ethique.png';
      case 'fin des temps':
        return 'assets/icons/temps.png';
      case 'ethique social':
        return 'assets/icons/social.png';
      case 'vie pratique & société':
        return 'assets/icons/societe.png';
      case 'vie spirituelle':
        return 'assets/icons/spirituel.png';
      default:
        return 'assets/icons/default.png';
    }
  }
}
