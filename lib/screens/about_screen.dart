import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('À Propos'),
        backgroundColor: Colors.green[700],
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Center(
              child: Column(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.green[100],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.asset(
                      'assets/images/splash.jpg',
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'ECHOCF',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[700],
                    ),
                  ),
                  Text(
                    'Recueil de Cantiques',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Description de l'application
            _buildSection(
              title: 'À Propos de l\'Application',
              content: 'Cette application a été développée pour faciliter l\'accès aux cantiques de l\'Entente des Chorales des Cultes en Français (ECHOCF) de la Communauté des Églises Baptistes Indépendantes (CEBI).',
              icon: Icons.info,
            ),

            const SizedBox(height: 20),

            // Fonctionnalités
            _buildSection(
              title: 'Fonctionnalités',
              content: '• Navigation par catégories\n• Recherche avancée\n• Favoris\n• Réglage de la taille de police\n• Interface intuitive et moderne',
              icon: Icons.featured_play_list,
            ),

            const SizedBox(height: 20),

            // Équipe de développement
            _buildSection(
              title: 'Équipe de Développement',
              content: 'Cette application a été réalisée avec Flutter par une équipe passionnée dédiée à servir la communauté chrétienne through la technologie.',
              icon: Icons.people,
            ),

            const SizedBox(height: 20),

            // Contact
            _buildSection(
              title: 'Contact & Support',
              content: 'Pour toute question ou suggestion, n\'hésitez pas à nous contacter.\n\nVersion: 1.0.0',
              icon: Icons.contact_support,
            ),

            const SizedBox(height: 30),

            // Footer
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green[50],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.green[100]!),
              ),
              child: const Text(
                '« Proclamons la bonne nouvelle ! »',
                style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({required String title, required String content, required IconData icon}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(color: Colors.green[100]!),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: Colors.green[700],
            size: 24,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[700],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  content,
                  style: const TextStyle(
                    fontSize: 14,
                    height: 1.5,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}