import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:just_app/src/widgets/custom_text_field.dart';
import 'package:just_app/src/widgets/custom_button.dart';
import 'forgotPassword.dart';
import 'package:just_app/src/services/auth_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _auth = AuthService();

  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();

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
          ),
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

                // Forgot password text
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // Forgot password event listener
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
                      );
                    },
                    child: Text(
                      'Esqueci-me da password',
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                  ),
                ),

                SizedBox(height: 20),

                // Login Button
                CustomButton(
                  text: 'Entrar',
                  textColor: Colors.white,
                  color: Colors.blueAccent,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _signup();                      
                    }
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
                        SnackBar(content: Text('Login com sucesso!')),
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

  _signup() async{
    final user = await _auth.loginUserWithEmailAndPassword(_email.text, _password.text);

    if(user != null){
      Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPasswordPage()),);
    }else{
      log("Something went wrong!");
    }
  }
}