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
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.green[100]!,
                Colors.green[50]!,
              ],
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Container pour l'icône personnalisée
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.green.withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Image.asset(
                    _getCategoryIconPath(category),
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      // Si l'icône n'est pas trouvée, afficher une icône par défaut
                      return Icon(
                        Icons.library_music,
                        color: Colors.green[700],
                        size: 24,
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Container(
                height: 30,
                child: Text(
                  category,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[900],
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                '$songCount cantique${songCount > 1 ? 's' : ''}',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.green[600],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // CETTE FONCTION APPELLE AUTOMATIQUEMENT VOS ICÔNES
  String _getCategoryIconPath(String category) {
    switch (category.toLowerCase()) {
      case 'évangélisation':
        return 'assets/icons/evangelisation.png';
      case 'salut':
        return 'assets/icons/salut.png';
      case 'sainteté':
        return 'assets/icons/saintete.png';
      case 'bible':
        return 'assets/icons/bible.png';
      case 'unité':
        return 'assets/icons/unite.png';
      case 'combat spirituel':
        return 'assets/icons/combat.png';
      case 'famille':
        return 'assets/icons/famille.png';
      case 'éthique chrétienne':
        return 'assets/icons/ethique.png';
      case 'prophétie':
        return 'assets/icons/prophetie.png';
      default:
        return 'assets/icons/default.png';
    }
  }
}