import 'package:flutter/material.dart';

class Establecimientos extends StatelessWidget {
  const Establecimientos({Key? key}) : super(key: key);

  // Datos de ejemplo
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
        title: const Text('Establecimientos'),
        centerTitle: true,
        // Si tienes flexibleSpace (degradado en AppBar) lo dejas aquí,
        // el body con degradado va abajo.
        backgroundColor: const Color.fromARGB(255, 8, 3, 81),
        elevation: 6,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),

      // ---------- BODY con degradado y lista ----------
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 0, 0, 0), // oscuro arriba
              Color.fromARGB(255, 59, 55, 255),
              Color.fromARGB(255, 114, 43, 236), // más claro abajo
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: establecimientos.length,
          itemBuilder: (context, index) {
            final lugar = establecimientos[index];

            final String nombre = (lugar['nombre'] as String?) ?? 'Nombre no disponible';
            final String? imagenPath = (lugar['imagen'] as String?);
            final double cal = (lugar['calificacion'] is num)
                ? (lugar['calificacion'] as num).toDouble()
                : 0.0;

            // DEBUG: mira la consola para confirmar las rutas
            // ignore: avoid_print
            print('DEBUG lugar $index -> nombre: $nombre, imagen: $imagenPath, cal: $cal');

            return Card(
              color: const Color(0xFFFDF7FD),
              margin: const EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              elevation: 6,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: (imagenPath != null && imagenPath.isNotEmpty)
                          ? Image.asset(
                              imagenPath,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  width: 100,
                                  height: 100,
                                  color: Colors.grey[200],
                                  child: const Icon(Icons.broken_image, size: 40),
                                );
                              },
                            )
                          : Container(
                              width: 100,
                              height: 100,
                              color: Colors.grey[200],
                              child: const Icon(Icons.image_not_supported, size: 40),
                            ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            nombre,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 8),
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
