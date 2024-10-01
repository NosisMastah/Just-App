import 'package:flutter/material.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';
import 'src/screens/login/login.dart'; // Importando a página de login

void main() async {
  final settingsController = SettingsController(SettingsService());
  await settingsController.loadSettings();
  runApp(MyApp(settingsController: settingsController));
}

class MyApp extends StatelessWidget {
  final SettingsController settingsController;

  MyApp({required this.settingsController});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minha Aplicação',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Definindo as rotas
      routes: {
        '/': (context) => MyHomePage(settingsController: settingsController),
        '/login': (context) => LoginPage(), // Definindo a rota para a página de login
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  final SettingsController settingsController;

  MyHomePage({required this.settingsController});

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
