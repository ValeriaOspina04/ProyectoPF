import 'package:flutter/material.dart';

class Establecimientos extends StatelessWidget {
  const Establecimientos({super.key});

  final List<Map<String, dynamic>> establecimientos = const [
    {
      'nombre': 'Bar La Noche',
      'imagen': 'assets/laNoche.jpeg',
      'calificacion': 4.5,
    },
    {
      'nombre': 'Club Fiesta',
      'imagen': 'assets/clubFiesta.jpg',
      'calificacion': 4.0,
    },
    {
      'nombre': 'Lounge VIP',
      'imagen': 'assets/vip.jpg',
      'calificacion': 5.0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Establecimientos',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true, // centra el título
        backgroundColor: const Color.fromARGB(255, 1, 16, 96), // color principal de PartyFinder
        elevation: 6, // sombra más pronunciada
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(12), // bordes redondeados abajo
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Color.fromARGB(137, 173, 219, 233)),
            onPressed: () {
              // acción de búsqueda
      },
    ),
  ],
   iconTheme: const IconThemeData(
    color: Colors.white, // íconos del AppBar en blanco (ej. botón del drawer)
  ),
),

       body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: establecimientos.length,
        itemBuilder: (context, index) {
          final lugar = establecimientos[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  // Imagen del establecimiento
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      lugar[''],
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Nombre y calificación
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          lugar['nombre'],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        // Mostrar estrellas según calificación
                        Row(
                          children: List.generate(5, (i) {
                            double cal = lugar['calificacion'];
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
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
