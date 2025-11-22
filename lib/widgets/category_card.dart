import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String category;
  final int songCount;
  final VoidCallback onTap;

  const CategoryCard({
    super.key,
    required this.category,
    required this.songCount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: const EdgeInsets.all(12), // Réduit le padding
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.green[50]!,
                Colors.green[50]!,
              ],
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                _getCategoryIcon(category),
                size: 32, // Réduit la taille de l'icône
                color: Colors.green[700],
              ),
              const SizedBox(height: 6), // Espacement réduit
              Container(
                height: 32, // Hauteur fixe pour le texte
                child: Text(
                  category,
                  style: TextStyle(
                    fontSize: 12, // Police plus petite
                    fontWeight: FontWeight.bold,
                    color: Colors.green[900],
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2, // Maximum 2 lignes
                  overflow: TextOverflow.ellipsis, // Points de suspension si trop long
                ),
              ),
              const SizedBox(height: 2), // Espacement réduit
              Text(
                '$songCount cantique${songCount > 1 ? 's' : ''}',
                style: TextStyle(
                  fontSize: 10, // Police plus petite
                  color: Colors.green[600],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getCategoryIcon(String category) {
    switch (category.toLowerCase()) {
      case 'évangélisation':
        return Icons.volume_up;
      case 'salut':
        return Icons.favorite;
      case 'sainteté':
        return Icons.flag;
      case 'bible':
        return Icons.book;
      case 'unité':
        return Icons.people;
      case 'combat spirituel':
        return Icons.security;
      case 'famille':
        return Icons.family_restroom;
      case 'éthique chrétienne':
        return Icons.gavel;
      case 'prophétie':
        return Icons.visibility;
      default:
        return Icons.library_music;
    }
  }
}