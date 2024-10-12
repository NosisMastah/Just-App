import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class AuthService {
  FirebaseAuth? _auth;

  // Método para inicializar o Firebase
  Future<void> initializeFirebase() async {
    if (Firebase.apps.isEmpty) {
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
    }
    _auth = FirebaseAuth.instance;
  }

  // Criar usuário com e-mail e senha
  Future<User?> createUserWithEmailAndPassword(String email, String password) async {
    await initializeFirebase();
    try {
      final cred = await _auth!.createUserWithEmailAndPassword(email: email, password: password);
      return cred.user;
    } catch (e) {
      log("Something went wrong during account creation: $e");
    }
    return null;
  }

  // Login com e-mail e senha
  Future<User?> loginUserWithEmailAndPassword(String email, String password) async {
    await initializeFirebase();
    try {
      final cred = await _auth!.signInWithEmailAndPassword(email: email, password: password);
      return cred.user;
    } catch (e) {
      log("Something went wrong during login: $e");
    }
    return null;
  }

  // Logout
  Future<void> signOut() async {
    await initializeFirebase();
    try {
      await _auth!.signOut();
    } catch (e) {
      log("Something went wrong during sign out: $e");
    }
  }
}