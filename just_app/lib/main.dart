import 'package:flutter/foundation.dart'; // kIsWeb support
import 'package:flutter/material.dart';
import 'src/screens/login/login.dart'; // Login Page
import 'package:firebase_core/firebase_core.dart'; // Firebase Core

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Definindo as rotas
      routes: {
        '/': (context) => MyHomePage(),
        '/login': (context) => LoginPage(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página Inicial'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navegar para a página de login ao clicar no botão
            Navigator.pushNamed(context, '/login');
          },
          child: Text('Login'),
        ),
      ),
    );
  }
}
