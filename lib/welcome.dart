import 'dart:async';
import 'package:flutter/material.dart';
import 'package:library_app/login.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  void initState() {
    super.initState();

    // Après 15 secondes, naviguer vers la page suivante
    Timer(const Duration(seconds: 15), () {
      _navigateToNextScreen();
    });
  }

  void _navigateToNextScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Login()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _navigateToNextScreen, // Si l'utilisateur appuie, il passe à la page suivante
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 99, 80, 64),
                    Color.fromARGB(255, 196, 180, 167)
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.center,
                ),
              ),
            ),
            Center(
              child: Image.asset(
                "image/1.png", // Assure-toi que le chemin est correct
                width: 500,
                height: 500,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Remplace ceci par ta page suivante
class NextScreen extends StatelessWidget {
  const NextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Page Principale")),
      body: const Center(child: Text("Bienvenue sur l'application !")),
    );
  }
}
