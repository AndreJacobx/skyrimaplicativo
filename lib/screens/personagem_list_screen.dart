import 'package:flutter/material.dart';
import '../models/personagem.dart';
import '../services/personagem_service.dart';
import 'personagem_form_screen.dart';

class PersonagemListScreen extends StatefulWidget {
  const PersonagemListScreen({super.key});

  @override
  _PersonagemListScreenState createState() => _PersonagemListScreenState();
}

class _PersonagemListScreenState extends State<PersonagemListScreen> {
  final PersonagemService _service = PersonagemService();
  late Future<List<Personagem>> _futurePersonagens;

  @override
  void initState() {
    super.initState();
    _futurePersonagens = _service.getPersonagens();
  }

  void _refreshList() {
    setState(() {
      _futurePersonagens = _service.getPersonagens();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Personagens')),
      body: FutureBuilder<List<Personagem>>(
        future: _futurePersonagens,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Erro ao carregar personagens'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Nenhum personagem cadastrado'));
          }
          final personagens = snapshot.data!;
          return ListView.builder(
            itemCount: personagens.length,
            itemBuilder: (context, index) {
              final personagem = personagens[index];
              return ListTile(
                title: Text(personagem.nome),
                subtitle: Text('${personagem.raca} - ${personagem.arma}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                PersonagemFormScreen(personagem: personagem),
                          ),
                        ).then((_) => _refreshList());
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () async {
                        await _service.deletePersonagem(personagem.id!);
                        _refreshList();
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/form').then((_) => _refreshList());
        },
      ),
    );
  }
}
