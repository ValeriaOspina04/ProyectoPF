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
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white, fontSize: 22),
        ),
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
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text('Nombre Usuario'),
              accountEmail: const Text('usuario@email.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 40),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.book),
              title: const Text('Reservas'),
              onTap: () {
                Navigator.pushNamed(context, '/reservas');
              },
            ),
            ListTile(
              leading: const Icon(Icons.store),
              title: const Text('Establecimientos'),
              onTap: () {
                Navigator.pushNamed(context, '/establecimientos');
              },
            ),
            ListTile(
              leading: const Icon(Icons.rate_review),
              title: const Text('Reseñas'),
              onTap: () {
                Navigator.pushNamed(context, '/resenas');
              },
            ),
            const Spacer(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Cerrar sesión'),
              onTap: () {
                // lógica de cerrar sesión
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text(
          'Bienvenido a Party Finder 🎉',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
