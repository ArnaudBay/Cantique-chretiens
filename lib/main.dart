import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'services/favorites_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  _initializeApp();
  runApp(const MyApp());
}

Future<void> _initializeApp() async {
  // Initialiser le service des favoris au démarrage
  try {
    await FavoritesService().init();
    print('Service des favoris initialisé avec succès');
  } catch (e) {
    print('Erreur lors de l\'initialisation des favoris: $e');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recueil des Cantiques ECHOCF',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}