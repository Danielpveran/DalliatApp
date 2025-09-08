import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

// ESTO ES DEL LOGIN
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,  // Color de la cosa que se muestra de menu
        scaffoldBackgroundColor: const Color.fromARGB(255, 226, 173, 27),  // Fondo de la pantalla
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black),  // Estilo de texto general
        ),
      ),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Dalliat App'),
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Login'),
                Tab(text: 'Registro'),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              LoginTab(),
              RegisterTab(),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginTab extends StatefulWidget {
  const LoginTab({super.key});

  @override
  State<LoginTab> createState() => _LoginTabState();
}

class _LoginTabState extends State<LoginTab> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _usernameController,
            decoration: const InputDecoration(
              labelText: 'Usuario',
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Contraseña',
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              // Aca se agregara la lógica de login mas adelante cuando halla base de datos
              print('Usuario: ${_usernameController.text}');
              print('Contraseña: ${_passwordController.text}');
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Login simulado')),
              );
            },
            child: const Text('Iniciar Sesión'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

class RegisterTab extends StatelessWidget {
  const RegisterTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Registro no funcional aún',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}

// Aca empieza el