import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/personagem.dart';

class PersonagemService {
  final String apiUrl = "http://localhost:3000/personagens";

  Future<List<Personagem>> getPersonagens() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((personagem) => Personagem.fromJson(personagem))
          .toList();
    } else {
      throw Exception('Erro ao carregar personagens');
    }
  }

  Future<Personagem> addPersonagem(Personagem personagem) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(personagem.toJson()),
    );
    if (response.statusCode == 201) {
      return Personagem.fromJson(json.decode(response.body));
    } else {
      throw Exception('Erro ao adicionar personagem');
    }
  }

  Future<void> deletePersonagem(String id) async {
    final response = await http.delete(Uri.parse('$apiUrl/$id'));
    if (response.statusCode != 200) {
      throw Exception('Erro ao deletar personagem');
    }
  }

  Future<Personagem> updatePersonagem(Personagem personagem) async {
    final response = await http.put(
      Uri.parse('$apiUrl/${personagem.id}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(personagem.toJson()),
    );
    if (response.statusCode == 200) {
      return Personagem.fromJson(json.decode(response.body));
    } else {
      throw Exception('Erro ao atualizar personagem');
    }
  }
}
