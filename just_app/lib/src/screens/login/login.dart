import 'package:flutter/material.dart';
import 'package:just_app/src/widgets/custom_input_field.dart';
import 'package:just_app/src/widgets/custom_button.dart';
import 'forgotPassword.dart';

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
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0), // Padding lateral
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
                CustomInputField(
                  labelText: 'Email',
                  icon: Icons.email,
                  onChanged: (value) {
                    setState(() {
                      _email = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira o email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),

                // Password input
                CustomInputField(
                  labelText: 'Password',
                  icon: Icons.lock,
                  isPassword: true,
                  onChanged: (value) {
                    setState(() {
                      _password = value;
                    });
                  },
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
                      'Esqueci-me a password',
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
                      // Login event listener
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Login com sucesso!')),
                      );
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
}
