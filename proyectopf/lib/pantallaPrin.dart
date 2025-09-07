import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 🌃 Fondo con silueta ciudad
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black87, Colors.deepPurple],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          // 📌 Contenido centrado
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 🥂 Logo
                Image.asset(
                  "assets/icon/party.png",
                  width: 120,
                  height: 120,
                ),
                const SizedBox(height: 20),
                // Texto con efecto neón
                Text(
                  "Encuentra tu mejor plan",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.purpleAccent.shade100,
                    shadows: [
                      Shadow(
                        blurRadius: 15.0,
                        color: Colors.purpleAccent,
                        offset: Offset(0, 0),
                      ),
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
