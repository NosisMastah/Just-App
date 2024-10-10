import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';
import 'src/screens/login/login.dart'; // Importando a página de login
import 'package:firebase_core/firebase_core.dart';

void main() async {
	WidgetsFlutterBinding.ensureInitialized();

  if(kIsWeb){
		await Firebase.initializeApp(
			options: FirebaseOptions(
				apiKey: "AIzaSyCJiz9OW-IRp93L8qUWZvYesr33nA6lBL8",
				authDomain: "just-app-358a0.firebaseapp.com",
				projectId: "just-app-358a0",
				storageBucket: "just-app-358a0.appspot.com",
				messagingSenderId: "1041744619832",
				appId: "1:1041744619832:web:12a9ef980354e6c5fcf9cd",
				measurementId: "G-6F4RKL45H2"));
	}else{
		await Firebase.initializeApp();
	}

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
