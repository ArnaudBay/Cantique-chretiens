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
        padding: const EdgeInsets.all(16), // Padding réduit
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Center(
              child: Column(
                children: [
                  Container(
                    width: 80, // Réduit de 100 à 80
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20), // Réduit de 25 à 20
                      boxShadow: [
                        BoxShadow(
                          color: Colors.green.withOpacity(0.2),
                          blurRadius: 8, // Réduit de 10 à 8
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: SizedBox(
                        width: 150,
                        height: 150,
                        child: Image.asset(
                          'assets/images/splash.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                  ),
                  const SizedBox(height: 12), // Réduit de 16 à 12
                  Text(
                    'ECHOCF',
                    style: TextStyle(
                      fontSize: 24, // Réduit de 28 à 24
                      fontWeight: FontWeight.bold,
                      color: Colors.green[700],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Entente des Chorales des Cultes en Français',
                      style: TextStyle(
                        fontSize: 12, // Réduit de 14 à 12
                        color: Colors.grey[600],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24), // Réduit de 30 à 24

            // Histoire de l'ECHOCF
            _buildSection(
              title: 'Notre Histoire',
              content: 'Gréée le 05 Décembre 2004, l\'Entente des Chorales des Cultes en Français (ECHOCF) de la CEBI de Bangui a réalisé sa première rencontre inter-chorale le 22 Mai 2007 à l\'issue de laquelle son hymne "Proclamons la Bonne Nouvelle" et son premier cantique d\'ensemble "La Nouvelle Naissance" ont été chantés.',
              icon: Icons.history,
            ),

            const SizedBox(height: 16), // Réduit de 20 à 16

            // Mission
            _buildSection(
              title: 'Notre Mission',
              content: 'De 2007 à nos jours, plusieurs rencontres inter-chorales se sont déroulées autour de différents thèmes. Animé par l\'esprit de louange et d\'adoration, le Bureau Exécutif de l\'ECHOCF a voulu pérenniser son œuvre musicale par la publication de ce Recueil des Cantiques d\'Ensemble.',
              icon: Icons.home,
            ),

            const SizedBox(height: 16),

            // ÉQUIPE DE DÉVELOPPEMENT - TAILLES RÉDUITES
            Container(
              padding: const EdgeInsets.all(16), // Réduit de 20 à 16
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.green[50]!,
                    Colors.green[100]!,
                  ],
                ),
                borderRadius: BorderRadius.circular(12), // Réduit de 15 à 12
                border: Border.all(color: Colors.green[200]!, width: 1.5), // Réduit de 2 à 1.5
                boxShadow: [
                  BoxShadow(
                    color: Colors.green.withOpacity(0.1),
                    blurRadius: 10, // Réduit de 15 à 10
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.code,
                        color: Colors.green[700],
                        size: 22, // Réduit de 10 à 22 (corrigé)
                      ),
                      const SizedBox(width: 8), // Réduit de 12 à 8
                      Expanded( // Ajouté Expanded pour éviter le débordement
                        child: Text(
                          'Équipe de Développement',
                          style: TextStyle(
                            fontSize: 18, // Réduit de 20 à 18
                            fontWeight: FontWeight.bold,
                            color: Colors.green[700],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12), // Réduit de 16 à 12

                  // Concepteur
                  _buildTeamMember(
                    name: 'Bureau Exécutif ECHOCF',
                    role: 'Concepteur & Visionnaire',
                    description: 'L\'idée originale de cette application revient au Bureau Exécutif de l\'ECHOCF, dont la vision inspirante a permis la concrétisation de ce projet numérique au service de la louange.',
                    icon: Icons.lightbulb_outline,
                  ),

                  const SizedBox(height: 16), // Réduit de 20 à 16

                  // Développeurs
                  Text(
                    'Développeurs Techniques',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.green[800],
                    ),
                  ),
                  const SizedBox(height: 12), // Réduit de 20 à 12

                  // DISPOSITION HORIZONTALE MAINTENUE - AVEC ESPACEMENT RÉDUIT
                  Row(
                    children: [
                      Expanded(
                        child: _buildDeveloperCardWithPhoto(
                          name: 'William GBOGODO',
                          role: 'Développeur Flutter',
                          specialty: 'williamgbogodo@gmail.com',
                          photoPath: 'assets/images/william.png',
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: _buildDeveloperCardWithPhoto(
                          name: 'Arnaud BAYALE',
                          role: 'Développeur Web Mobile',
                          specialty: 'arnaudbayale@gmail.com',
                          photoPath: 'assets/images/arnaud.png',
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),
                  Text(
                    'Ces deux développeurs ont travaillé avec passion et dévouement pour mettre à disposition ces cantiques sous format digital, combinant expertise technique et sensibilité spirituelle.',
                    style: TextStyle(
                      fontSize: 13, // Réduit de 14 à 13
                      color: Colors.green[800],
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16), // Réduit de 20 à 16

            // Versets bibliques
            _buildSection(
              title: 'Paroles d\'Encouragement',
              content: '« Entretenez-vous par des psaumes, par des hymnes, et par des cantiques spirituels, chantant et célébrant de tout votre cœur les louanges du Seigneur » (Éphésiens 5:19)\n\n« Mais l\'heure vient, et elle est déjà venue, où les vrais adorateurs adoreront le Père en esprit et en vérité ; car ce sont là les adorateurs que le Père demande. Dieu est Esprit, et il faut que ceux qui l\'adorent l\'adorent en esprit et en vérité » (Jean 4:23-24)',
              icon: Icons.book,
            ),

            const SizedBox(height: 16),

            // Message d'encouragement
            _buildSection(
              title: 'Message du Représentant',
              content: '« Que le Saint-Esprit vous donne une impression de chaleur pour vous aider à comprendre que les paroles et le message de ces chants disent la vérité. Ainsi, vous pouvez vous instruire dans l\'Évangile et votre témoignage grandira au fur et à mesure que vous vous instruirez. On se souvient plus facilement de ce qu\'on apprend lorsqu\'on le chante. La mélodie des chants vous aide à vous souvenir des paroles et communique leurs sentiments à votre cœur.\n\nQue le Saint-Esprit vous aide à chanter à l\'honneur de notre Dieu avec un esprit de force, sagesse et amour (2 Timothée 1:7). »',
              icon: Icons.record_voice_over,
            ),

            const SizedBox(height: 16),

            // Signature
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12), // Réduit de 16 à 12
              decoration: BoxDecoration(
                color: Colors.green[50],
                borderRadius: BorderRadius.circular(8), // Réduit de 10 à 8
                border: Border.all(color: Colors.green[100]!),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Vive l\'ECHOCF !',
                    style: TextStyle(
                      fontSize: 14, // Réduit de 16 à 14
                      fontWeight: FontWeight.bold,
                      color: Colors.green[700],
                    ),
                  ),
                  const SizedBox(height: 6), // Réduit de 8 à 6
                  Text(
                    'Le Représentant',
                    style: TextStyle(
                      fontSize: 12, // Réduit de 14 à 12
                      color: Colors.green[600],
                    ),
                  ),
                  Text(
                    'Cyr Bienvenu TAKELEPOU',
                    style: TextStyle(
                      fontSize: 12, // Réduit de 14 à 12
                      fontWeight: FontWeight.w500,
                      color: Colors.green[700],
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Informations techniques
            _buildSection(
              title: 'À Propos de l\'Application',
              content: 'Cette application a été développée pour faciliter l\'accès aux cantiques de l\'ECHOCF. Elle offre une navigation intuitive, une recherche avancée et la possibilité de marquer vos cantiques favoris.\n\nVersion: 1.0.0',
              icon: Icons.info,
            ),

            const SizedBox(height: 20), // Réduit de 30 à 20

            // Footer
            Container(
              padding: const EdgeInsets.all(12), // Réduit de 16 à 12
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(8), // Réduit de 10 à 8
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: Column(
                children: [
                  Text(
                    '« Proclamons la bonne nouvelle ! »',
                    style: TextStyle(
                      fontSize: 14, // Réduit de 16 à 14
                      fontWeight: FontWeight.bold,
                      color: Colors.green[700],
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 6), // Réduit de 8 à 6
                  Text(
                    'Communauté des Églises Baptistes Indépendantes',
                    style: TextStyle(
                      fontSize: 11, // Réduit de 12 à 11
                      color: Colors.grey[600],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({required String title, required String content, required IconData icon}) {
    return Container(
      padding: const EdgeInsets.all(12), // Réduit de 16 à 12
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8), // Réduit de 10 à 8
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 8, // Réduit de 10 à 8
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
            size: 20, // Réduit de 24 à 20
          ),
          const SizedBox(width: 12), // Réduit de 16 à 12
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16, // Réduit de 18 à 16
                    fontWeight: FontWeight.bold,
                    color: Colors.green[700],
                  ),
                ),
                const SizedBox(height: 6), // Réduit de 8 à 6
                Text(
                  content,
                  style: const TextStyle(
                    fontSize: 13, // Réduit de 14 à 13
                    height: 1.4, // Réduit de 1.5 à 1.4
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

  Widget _buildTeamMember({
    required String name,
    required String role,
    required String description,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.all(10), // Réduit de 12 à 10
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8), // Réduit de 10 à 8
        border: Border.all(color: Colors.green[100]!),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 36, // Réduit de 40 à 36
            height: 36,
            decoration: BoxDecoration(
              color: Colors.green[100],
              borderRadius: BorderRadius.circular(6), // Réduit de 8 à 6
            ),
            child: Icon(
              icon,
              color: Colors.green[700],
              size: 18, // Réduit de 20 à 18
            ),
          ),
          const SizedBox(width: 10), // Réduit de 12 à 10
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 14, // Réduit de 16 à 14
                    fontWeight: FontWeight.bold,
                    color: Colors.green[800],
                  ),
                ),
                Text(
                  role,
                  style: TextStyle(
                    fontSize: 12, // Réduit de 14 à 12
                    color: Colors.green[600],
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 12, // Réduit de 13 à 12
                    color: Colors.black87,
                    height: 1.3, // Réduit de 1.4 à 1.3
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // FONCTION AVEC PHOTOS - TAILLES RÉDUITES
  Widget _buildDeveloperCardWithPhoto({
    required String name,
    required String role,
    required String specialty,
    required String photoPath,
  }) {
    return Container(
      padding: const EdgeInsets.all(10), // Réduit de 12 à 10
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10), // Réduit de 12 à 10
        border: Border.all(color: Colors.green[200]!),
        boxShadow: [
          BoxShadow(
            color: Colors.green.withOpacity(0.08), // Réduit l'opacité
            blurRadius: 6, // Réduit de 8 à 6
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Photo de profil - TAILLE RÉDUITE
          Container(
            width: 60, // Réduit de 70 à 60
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), // Réduit de 35 à 30
              border: Border.all(color: Colors.green[300]!, width: 1.5), // Réduit de 2 à 1.5
              boxShadow: [
                BoxShadow(
                  color: Colors.green.withOpacity(0.15), // Réduit l'opacité
                  blurRadius: 4, // Réduit de 5 à 4
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                photoPath,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.green[100],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Icon(
                      Icons.person,
                      color: Colors.green[700],
                      size: 25, // Réduit de 30 à 25
                    ),
                  );
                },
              ),
            ),
          ),

          const SizedBox(height: 8), // Réduit de 12 à 8

          // Nom
          Text(
            name,
            style: TextStyle(
              fontSize: 12, // Réduit de 14 à 12
              fontWeight: FontWeight.bold,
              color: Colors.green[800],
            ),
            textAlign: TextAlign.center,
            maxLines: 2, // Limite à 2 lignes si nécessaire
          ),

          const SizedBox(height: 4),

          // Rôle
          Text(
            role,
            style: TextStyle(
              fontSize: 11, // Réduit de 12 à 11
              color: Colors.green[700],
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 2), // Réduit de 4 à 2

          // Spécialité
          Text(
            specialty,
            style: TextStyle(
              fontSize: 10, // Réduit de 11 à 10
              color: Colors.green[600],
            ),
            textAlign: TextAlign.center,
            maxLines: 2, // Limite à 2 lignes si nécessaire
          ),
        ],
      ),
    );
  }
}