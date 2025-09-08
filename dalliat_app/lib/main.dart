import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 255, 255, 255),  // Color principal
        scaffoldBackgroundColor: const Color.fromARGB(255, 226, 173, 27),  // Fondo de la pantalla
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),  // Estilo de texto general
        ),
      ),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Dalliat App'),
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),  // Cambia el color de fondo
            titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            ),
            bottom: const TabBar(
              tabs: [
                Tab(text: 'LogIn'),
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
              filled: true,  // Habilita el fondo
              fillColor: const Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Contraseña',
              border: OutlineInputBorder(),
              filled: true,  // Habilita el fondo
              fillColor: const Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              // Aquí puedes agregar lógica de login
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
