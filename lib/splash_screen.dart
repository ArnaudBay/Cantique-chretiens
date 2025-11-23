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
    Future.delayed(const Duration(seconds: 5), () {
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

          // Overlay vert pour améliorer la lisibilité
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.green[900]!.withOpacity(0.7),
                  Colors.green[800]!.withOpacity(0.6),
                  Colors.green[700]!.withOpacity(0.5),
                ],
              ),
            ),
          ),

          // Éléments décoratifs
          Positioned(
            top: -50,
            right: -50,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.05),
                shape: BoxShape.circle,
              ),
            ),
          ),

          Positioned(
            bottom: -80,
            left: -80,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.03),
                shape: BoxShape.circle,
              ),
            ),
          ),

          // Contenu principal
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Espace vide en haut
                const SizedBox(height: 20),

                // Contenu central
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // LOGO
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Image.asset(
                            'assets/images/splash.jpg',
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) {
                              // Si le logo n'est pas trouvé, afficher une icône par défaut
                              return Icon(
                                Icons.music_note,
                                size: 50,
                                color: Color(0xFF2E7D32),
                              );
                            },
                          ),
                        ),
                      ),

                      const SizedBox(height: 30),

                      // Titre avec ombre pour mieux ressortir sur l'image
                      Text(
                        'ECHOCF',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 2,
                          shadows: [
                            Shadow(
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        'Recueil de Cantiques',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white.withOpacity(0.9),
                          fontWeight: FontWeight.w300,
                          shadows: [
                            Shadow(
                              blurRadius: 5,
                              color: Colors.black.withOpacity(0.3),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 40),

                      // Message dans un container semi-transparent
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 40),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.3),
                            width: 1,
                          ),
                        ),
                        child: Column(
                          children: [
                            Text(
                              '« Proclamons la bonne nouvelle ! »',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.italic,
                                shadows: [
                                  Shadow(
                                    blurRadius: 5,
                                    color: Colors.black.withOpacity(0.3),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),

                            const SizedBox(height: 15),

                            Container(
                              height: 1,
                              color: Colors.white.withOpacity(0.3),
                            ),

                            const SizedBox(height: 15),

                            Text(
                              'Entente des Chorales des Cultes en Français',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white.withOpacity(0.9),
                                shadows: [
                                  Shadow(
                                    blurRadius: 3,
                                    color: Colors.black.withOpacity(0.3),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),

                            const SizedBox(height: 5),

                            Text(
                              'Communauté des Églises Baptistes Indépendantes',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white.withOpacity(0.8),
                                fontStyle: FontStyle.italic,
                                shadows: [
                                  Shadow(
                                    blurRadius: 3,
                                    color: Colors.black.withOpacity(0.3),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Indicateur de chargement
                Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 30,
                        height: 30,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          strokeWidth: 2,
                        ),
                      ),

                      const SizedBox(height: 15),

                      _CountdownTimer(),
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
        color: Colors.white.withOpacity(0.8),
        fontSize: 12,
        shadows: [
          Shadow(
            blurRadius: 3,
            color: Colors.black.withOpacity(0.3),
          ),
        ],
      ),
    );
  }
}