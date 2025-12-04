import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String category;
  final int songCount;
  final VoidCallback onTap;
  final String iconPath;

  const CategoryCard({
    super.key,
    required this.category,
    required this.songCount,
    required this.onTap,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    // Calcul des dimensions responsives
    final screenWidth = MediaQuery.of(context).size.width;

    // Facteur d'échelle basé sur la largeur de l'écran
    final scaleFactor = _getScaleFactor(screenWidth);

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15 * scaleFactor)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15 * scaleFactor),
        child: Container(
          padding: EdgeInsets.all(12 * scaleFactor),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.green[100]!,
                Colors.green[50]!,
              ],
            ),
            borderRadius: BorderRadius.circular(15 * scaleFactor),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Container pour l'icône personnalisée - Taille responsive
              Container(
                width: 48 * scaleFactor,
                height: 48 * scaleFactor,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12 * scaleFactor),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.green.withOpacity(0.2),
                      blurRadius: 8 * scaleFactor,
                      offset: Offset(0, 3 * scaleFactor),
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(8 * scaleFactor),
                  child: Image.asset(
                    iconPath, // Utiliser la variable passée au constructeur
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(
                        Icons.library_music,
                        color: Colors.green[700],
                        size: 24 * scaleFactor, // Taille d'icône responsive
                      );
                    },
                  ),
                ),
              ),

              SizedBox(height: 8 * scaleFactor), // Espacement responsive

              // Nom de la catégorie - Texte responsive
              Flexible(
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    category,
                    style: TextStyle(
                      fontSize: _getFontSize(screenWidth, isTitle: true),
                      fontWeight: FontWeight.bold,
                      color: Colors.green[900],
                      height: 1.2, // Interligne pour meilleure lisibilité
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),

              SizedBox(height: 4 * scaleFactor), // Espacement responsive

              // Nombre de cantiques - Texte responsive
              Text(
                '$songCount cantique${songCount > 1 ? 's' : ''}',
                style: TextStyle(
                  fontSize: _getFontSize(screenWidth, isTitle: false),
                  color: Colors.green[600],
                  fontWeight: FontWeight.w500, // Un peu plus gras pour mieux lire
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Fonction pour calculer le facteur d'échelle selon la taille de l'écran
  double _getScaleFactor(double screenWidth) {
    if (screenWidth < 320) {
      return 0.8; // Très petits écrans
    } else if (screenWidth < 375) {
      return 0.9; // Petits écrans
    } else if (screenWidth < 414) {
      return 1.0; // Écrans moyens
    } else if (screenWidth < 768) {
      return 1.1; // Grands smartphones
    } else if (screenWidth < 1024) {
      return 1.3; // Tablettes
    } else {
      return 1.5; // Grands écrans
    }
  }

  // Fonction pour calculer la taille de police adaptive
  double _getFontSize(double screenWidth, {required bool isTitle}) {
    if (screenWidth < 320) {
      return isTitle ? 10 : 9; // Très petits écrans
    } else if (screenWidth < 375) {
      return isTitle ? 11 : 10; // Petits écrans
    } else if (screenWidth < 414) {
      return isTitle ? 12 : 10; // Écrans moyens
    } else if (screenWidth < 768) {
      return isTitle ? 13 : 11; // Grands smartphones
    } else if (screenWidth < 1024) {
      return isTitle ? 14 : 12; // Tablettes
    } else {
      return isTitle ? 16 : 13; // Grands écrans
    }
  }
}
