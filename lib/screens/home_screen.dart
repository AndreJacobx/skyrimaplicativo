import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criador de Personagens - Skyrim'),
      ),
      body: const Center(
        child: Text(
          'Bem-vindo ao Criador de Personagens Skyrim!',
          style: TextStyle(fontSize: 20, color: Colors.grey),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/home');
              break;
            case 1:
              Navigator.pushNamed(context, '/list');
              break;
            case 2:
              Navigator.pushNamed(context, '/form');
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Personagens'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Adicionar'),
        ],
      ),
    );
  }
}
