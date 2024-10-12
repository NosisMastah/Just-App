import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:just_app/src/widgets/custom_text_field.dart';
import 'package:just_app/src/widgets/custom_button.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Registo Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RegistoPage(),
    );
  }
}

class RegistoPage extends StatefulWidget {
   @override
  _RegistoPageState createState() => _RegistoPageState();
}

class _RegistoPageState extends State<RegistoPage> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();

  @override
  // Apaga da memória os campos de email e password quando o Widget de login for apagado
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: kIsWeb ? width * 0.35 : 16.0,
            vertical: 16.0,
          ), // Padding lateral
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo_passaro.png', // Logo
                  width: 150,
                  height: 150,
                ),
                SizedBox(height: 20),

                // Screen title
                Text(
                  'Bem-vindo',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                SizedBox(height: 30),

                //Nome input
                CustomTextField(
                  labelText: 'Nome',
                  icon: Icons.person,
                  controller: _name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira o seu nome';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),

                // Email input
                CustomTextField(
                  labelText: 'Email',
                  icon: Icons.email,
                  controller: _email,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira o email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),

                // Password input
                CustomTextField(
                  labelText: 'Password',
                  icon: Icons.lock,
                  isPassword: true,
                  controller: _password,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira a senha';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),


                // Check Password input
                CustomTextField(
                  labelText: 'Confirmar Password',
                  icon: Icons.lock,
                  isPassword: true,
                  controller: _confirmPassword,
                  validator: (value1) {
                    if (value1 == null || value1.isEmpty) {
                      return 'Por favor, confirme a senha';
                    }

                    if (_password != _confirmPassword) {
                      return 'Por favor, insira a mesma senha.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),

                
                // Register button
                CustomButton(
                  text: 'Registar',
                  textColor: Colors.white,
                  color: Colors.blueAccent,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Login event listener
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Registo com sucesso!')),
                      );
                    }
                  },
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

}