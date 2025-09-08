import 'package:flutter/material.dart';

class Resenas extends StatelessWidget {
  const Resenas({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> resenas = [
      {
        'usuario': 'Ana López',
        'comentario': 'Excelente ambiente, la música estuvo genial 🎶',
        'calificacion': 5.0,
        'establecimiento': 'Bar La Noche',
      },
      {
        'usuario': 'Carlos Pérez',
        'comentario': 'El servicio fue rápido pero la pista estaba muy llena.',
        'calificacion': 3.5,
        'establecimiento': 'Club Fiesta',
      },
      {
        'usuario': 'María Gómez',
        'comentario': 'Me encantó la decoración y las luces 💜',
        'calificacion': 4.5,
        'establecimiento': 'Lounge VIP',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Reseñas"),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Color.fromARGB(255, 4, 70, 185)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1E1E2C), Color(0xFF3A1C71)], // Fondo oscuro degradado
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: resenas.length,
          itemBuilder: (context, index) {
            final resena = resenas[index];
            final double cal = resena['calificacion'];

            return Card(
              color: const Color.fromARGB(234, 206, 205, 205).withOpacity(0.9),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              margin: const EdgeInsets.symmetric(vertical: 10),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Usuario
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.deepPurple,
                          child: Icon(Icons.person, color: Colors.white),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          resena['usuario'],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),

                    // Establecimiento calificado
                    Text(
                      "Establecimiento: ${resena['establecimiento']}",
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.deepPurple,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Comentario
                    Text(
                      resena['comentario'],
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Estrellas
                    Row(
                      children: List.generate(5, (i) {
                        if (i < cal.floor()) {
                          return const Icon(Icons.star, color: Colors.amber, size: 20);
                        } else if (i < cal) {
                          return const Icon(Icons.star_half, color: Colors.amber, size: 20);
                        } else {
                          return const Icon(Icons.star_border, color: Colors.amber, size: 20);
                        }
                      }),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
