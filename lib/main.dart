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
        brightness: Brightness.dark,
        primaryColor: Colors.grey[900],
        scaffoldBackgroundColor: Colors.black87,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black87,
          titleTextStyle: TextStyle(color: Colors.grey[300], fontSize: 20),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.grey[850],
          selectedItemColor: Colors.grey[300],
          unselectedItemColor: Colors.grey[600],
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.grey[800],
            textStyle: const TextStyle(fontSize: 16),
          ),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.grey),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey[800],
          labelStyle: TextStyle(color: Colors.grey[300]),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[400]!),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
      home: HomeScreen(),
      routes: {
        '/home': (context) => HomeScreen(),
        '/list': (context) => PersonagemListScreen(),
        '/form': (context) => PersonagemFormScreen(),
      },
    );
  }
}
