import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import './data/songs_data.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Naviguer vers la page d'accueil après 5 secondes
    Future.delayed(const Duration(seconds: 5), () { // ✅ Changé de 3 à 5 secondes
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(songs: SongsData.getSongs()),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Image de fond
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/splash.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Overlay sombre pour améliorer la lisibilité
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black.withOpacity(0.4),
          ),

          // Contenu
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Titre en haut
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Text(
                    'ECHOCF',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 2,
                    ),
                  ),
                ),

                // Contenu central
                Expanded(
                  child: Center(
                    child: Container(
                      margin: const EdgeInsets.all(20),
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.green, width: 2),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Proclamons la bonne nouvelle !',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.green[300],
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Recueil des cantiques d\'ensemble de l\'Entente des Chorales des Cultes en français (ECHOCF)',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              height: 1.4,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Communauté des Églises Baptistes Indépendantes (CEBI)',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.green[200],
                              fontStyle: FontStyle.italic,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Indicateur de chargement avec compteur
                Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Column(
                    children: [
                      CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Chargement des cantiques...',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 5),
                      _CountdownTimer(), // ✅ Compteur de 5 secondes
                    ],
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

// Widget pour afficher un compteur de 5 à 0
class _CountdownTimer extends StatefulWidget {
  @override
  State<_CountdownTimer> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<_CountdownTimer> {
  int _seconds = 5;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    Future.doWhile(() {
      return Future.delayed(const Duration(seconds: 1), () {
        if (_seconds > 0) {
          setState(() {
            _seconds--;
          });
          return true;
        }
        return false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      'Démarrage dans $_seconds seconde${_seconds > 1 ? 's' : ''}',
      style: TextStyle(
        color: Colors.green[300],
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}