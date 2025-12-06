import 'dart:async';

import 'package:flutter/material.dart';
import 'data/songs_data.dart';
import 'screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {
    // Start the timer and song loading in parallel for efficiency
    final timerFuture = Future.delayed(const Duration(seconds: 5));
    final songsFuture = SongsData.loadSongs();

    // Wait for both to complete
    await Future.wait([timerFuture, songsFuture]);

    if (mounted) {
      final songs = await songsFuture;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(songs: songs),
        ),
      );
    }
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
          // Overlay with modern withAlpha
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.green[900]!.withAlpha(179), // 70% opacity
                  Colors.green[800]!.withAlpha(153), // 60% opacity
                  Colors.green[700]!.withAlpha(128), // 50% opacity
                ],
              ),
            ),
          ),

          // Decorative elements
          Positioned(
            top: -50,
            right: -50,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white.withAlpha(13), // 5% opacity
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
                color: Colors.white.withAlpha(8), // 3% opacity
                shape: BoxShape.circle,
              ),
            ),
          ),

          // Main content
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(height: 20),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Logo
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withAlpha(77), // 30% opacity
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
                              return const Icon(
                                Icons.music_note,
                                size: 50,
                                color: Color(0xFF2E7D32),
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),

                      // Title
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
                              color: Colors.black.withAlpha(128), // 50% opacity
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),

                      // Subtitle
                      Text(
                        'Recueil de Cantiques',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white.withAlpha(230), // 90% opacity
                          fontWeight: FontWeight.w300,
                          shadows: [
                            Shadow(
                              blurRadius: 5,
                              color: Colors.black.withAlpha(77), // 30% opacity
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),

                      // Message in a semi-transparent container
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 40),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.black.withAlpha(102), // 40% opacity
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: Colors.white.withAlpha(77), // 30% opacity
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
                                    color: Colors.black.withAlpha(77), // 30% opacity
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 15),
                            Container(
                              height: 1,
                              color: Colors.white.withAlpha(77), // 30% opacity
                            ),
                            const SizedBox(height: 15),
                            Text(
                              'Entente des Chorales des Cultes en Français',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white.withAlpha(230), // 90% opacity
                                shadows: [
                                  Shadow(
                                    blurRadius: 3,
                                    color: Colors.black.withAlpha(77), // 30% opacity
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
                                color: Colors.white.withAlpha(204), // 80% opacity
                                fontStyle: FontStyle.italic,
                                shadows: [
                                  Shadow(
                                    blurRadius: 3,
                                    color: Colors.black.withAlpha(77), // 30% opacity
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

                // Loading Indicator
                Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: Column(
                    children: [
                      const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        strokeWidth: 2,
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
  late Timer _timer;
  int _seconds = 5;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted && _seconds > 0) {
        setState(() {
          _seconds--;
        });
      } else {
        _timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _seconds > 0 ? 'Démarrage dans $_seconds seconde${_seconds > 1 ? 's' : ''}' : 'Démarrage...',
      style: TextStyle(
        color: Colors.white.withAlpha(204), // 80% opacity
        fontSize: 12,
        shadows: [
          Shadow(
            blurRadius: 3,
            color: Colors.black.withAlpha(77), // 30% opacity
          ),
        ],
      ),
    );
  }
}
