import 'package:flutter/material.dart';
import 'dart:async';
// Para ir al Home después

bool isLoggedIn = false; 

class PantallaTemp extends StatefulWidget {
  const PantallaTemp({super.key});

  @override
  State<PantallaTemp> createState() => _PantallaTempState();
}

class _PantallaTempState extends State<PantallaTemp> {
  @override
  void initState() {
    super.initState();
    // ⏳ Después de 5 segundos, volvemos al Home
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Image.asset(
          "assets/fondoP.png", 
          fit: BoxFit.cover,   // que cubra toda la pantalla
        ),
      ),
    );
  }
}
