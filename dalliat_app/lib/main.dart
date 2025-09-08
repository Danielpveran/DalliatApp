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

// Aca empieza el register

class RegisterTab extends StatefulWidget {
  const RegisterTab({super.key});

  @override
  State<RegisterTab> createState() => _RegisterTabState();
}

class _RegisterTabState extends State<RegisterTab> {
  final TextEditingController _regUsernameController = TextEditingController();
  final TextEditingController _regPasswordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _regUsernameController,
              decoration: const InputDecoration(
                labelText: 'Usuario',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _regPasswordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Contraseña',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Correo Electrónico',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Color.fromARGB(255, 255, 255, 255),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _birthDateController,
              readOnly: true,
              decoration: const InputDecoration(
                labelText: 'Fecha de Nacimiento',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Color.fromARGB(255, 255, 255, 255),
                suffixIcon: Icon(Icons.calendar_today),
              ),
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );
                if (pickedDate != null) {
                  setState(() {
                    _birthDateController.text = "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                  });
                }
              },
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Aquí puedes agregar lógica de registro
                print('Usuario: ${_regUsernameController.text}');
                print('Contraseña: ${_regPasswordController.text}');
                print('Correo: ${_emailController.text}');
                print('Fecha Nacimiento: ${_birthDateController.text}');
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Registro simulado exitoso')),
                );
              },
              child: const Text('Registrar'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _regUsernameController.dispose();
    _regPasswordController.dispose();
    _emailController.dispose();
    _birthDateController.dispose();
    super.dispose();
  }
}

// Aca empieza el