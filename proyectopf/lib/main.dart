import 'package:flutter/material.dart';
import 'package:proyectopf/establecimientos.dart';
import 'pantallaTemp.dart';
import 'login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Party Finder',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
          primary: Colors.deepPurple,
          secondary: Colors.blueAccent,
        ),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 1, 16, 96),
          elevation: 6,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
            color: Colors.white,       // 🔥 Color del texto en blanco
            fontWeight: FontWeight.bold,
            fontSize: 22,
            letterSpacing: 1.2,
          ),
        ),
      ),
      home: const PantallaTemp(),
      routes: {
        '/login': (context) => const Login(),
        '/home':  (context) => const MyHomePage(title: 'Party Finder'),
        '/establecimientos': (context) => const Establecimientos(),
      },

    );
  }
}



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        // 🎨 Degradado
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

      drawer: Drawer(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF1E1E2C), Color(0xFF3A1C71)], // 🎨 Fondo oscuro degradado
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF3A1C71), Color(0xFF2C5364)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                accountName: const Text(
                  'Nombre Usuario',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1.2,
                  ),
                ),
                accountEmail: const Text(
                  'usuario@email.com',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
                currentAccountPicture: const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 40, color: Colors.deepPurple),
                ),
              ),

              // Opciones de menú con diseño mejorado
              ListTile(
                leading: const Icon(Icons.book, color: Colors.white),
                title: const Text(
                  'Reservas',
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/reservas');
                },
              ),
              ListTile(
                leading: const Icon(Icons.store, color: Colors.white),
                title: const Text(
                  'Establecimientos',
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/establecimientos');
                },
              ),
              ListTile(
                leading: const Icon(Icons.rate_review, color: Colors.white),
                title: const Text(
                  'Reseñas',
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/resenas');
                },
              ),

              const Spacer(),

              const Divider(color: Colors.white54, thickness: 1, indent: 20, endIndent: 20),

              ListTile(
                leading: const Icon(Icons.logout, color: Colors.redAccent),
                title: const Text(
                  'Cerrar sesión',
                  style: TextStyle(color: Colors.redAccent, fontSize: 16, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),

      
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF1E1E2C), // Azul oscuro / noche
              Color(0xFF3A1C71), // Morado profundo
              Color(0xFF2C5364), // Azul verdoso elegante
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Destacados de la semana",
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // 👈 ahora el texto será blanco sobre fondo
                  ),
                ),
              ),

              const SizedBox(height: 16),

              SizedBox(
                height: 220,
                child: PageView(
                  controller: PageController(viewportFraction: 0.8),
                  children: [
                    _buildCarouselCard("assets/laNoche.jpeg", "Bar La Noche", 4.5),
                    _buildCarouselCard("assets/clubFiesta.jpg", "Club Fiesta", 4.0),
                    _buildCarouselCard("assets/vip.jpg", "Lounge VIP", 5.0),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Eventos próximos",
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // 👈 también en blanco
                  ),
                ),
              ),

              const SizedBox(height: 16),

              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  ListTile(
                    leading: Icon(Icons.music_note, color: Colors.purpleAccent),
                    title: Text("Concierto DJ Nights",
                        style: TextStyle(color: Colors.white)),
                    subtitle: Text(
                      "Viernes 10 de Septiembre - Club Fiesta",
                      style: TextStyle(color: Colors.white70),
                    ),
                    trailing: Icon(Icons.chevron_right, color: Colors.white),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.local_bar, color: Colors.purpleAccent),
                    title:
                        Text("Happy Hour", style: TextStyle(color: Colors.white)),
                    subtitle: Text(
                      "Todos los jueves - Bar La Noche",
                      style: TextStyle(color: Colors.white70),
                    ),
                    trailing: Icon(Icons.chevron_right, color: Colors.white),
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCarouselCard(String img, String title, double calificacion) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage(img),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [Colors.black.withOpacity(0.6), Colors.transparent],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 6),
              Row(
                children: List.generate(5, (i) {
                  if (i < calificacion.floor()) {
                    return const Icon(Icons.star, color: Colors.amber, size: 18);
                  } else if (i < calificacion) {
                    return const Icon(Icons.star_half, color: Colors.amber, size: 18);
                  } else {
                    return const Icon(Icons.star_border, color: Colors.amber, size: 18);
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
