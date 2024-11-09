/*
import 'package:test/test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'dart:convert';
import 'package:aplicativoskyrim/models/personagem.dart';
import 'package:aplicativoskyrim/services/personagem_service.dart';

void main() {
  group('PersonagemService', () {
    test('adiciona um personagem', () async {
      // Mock do cliente HTTP
      final client = MockClient((request) async {
        final mapJson = {
          'id': 1,
          'nome': 'Teste',
          'arma': 'Espada',
          'armadura': 'Couro',
          'magia': 'Fogo',
          'raca': 'Humano'
        };
        return http.Response(json.encode(mapJson), 201);
      });

      final service = PersonagemService();
      service.client = client; // Usando o cliente mockado no serviço

      final personagem = Personagem(
        nome: 'Teste',
        arma: 'Espada',
        armadura: 'Couro',
        magia: 'Fogo',
        raca: 'Humano',
      );

      final result = await service.addPersonagem(personagem);

      expect(result.id, equals(1));
      expect(result.nome, equals('Teste'));
      expect(result.arma, equals('Espada'));
      expect(result.armadura, equals('Couro'));
      expect(result.magia, equals('Fogo'));
      expect(result.raca, equals('Humano'));
    });
  });
}
*/