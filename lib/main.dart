// lib/main.dart
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/personagem_list_screen.dart';
import 'screens/personagem_form_screen.dart';

void main() {
  runApp(const SkyrimCharacterCreatorApp());
}

class SkyrimCharacterCreatorApp extends StatelessWidget {
  const SkyrimCharacterCreatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Criador de Personagens Skyrim',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // Define a tela inicial
      home: HomeScreen(),
      // Define as rotas do aplicativo
      routes: {
        '/home': (context) => HomeScreen(),
        '/list': (context) => PersonagemListScreen(),
        '/form': (context) => PersonagemFormScreen(),
      },
    );
  }
}
