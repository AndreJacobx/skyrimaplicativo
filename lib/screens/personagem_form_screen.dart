import 'package:flutter/material.dart';
import '../models/personagem.dart';
import '../services/personagem_service.dart';

class PersonagemFormScreen extends StatefulWidget {
  final Personagem? personagem;

  const PersonagemFormScreen({this.personagem});

  @override
  _PersonagemFormScreenState createState() => _PersonagemFormScreenState();
}

class _PersonagemFormScreenState extends State<PersonagemFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final PersonagemService _service = PersonagemService();
  late String _nome, _arma, _armadura, _magia, _raca;

  @override
  void initState() {
    super.initState();
    if (widget.personagem != null) {
      _nome = widget.personagem!.nome;
      _arma = widget.personagem!.arma;
      _armadura = widget.personagem!.armadura;
      _magia = widget.personagem!.magia;
      _raca = widget.personagem!.raca;
    } else {
      _nome = '';
      _arma = '';
      _armadura = '';
      _magia = '';
      _raca = '';
    }
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final personagem = Personagem(
        id: widget.personagem?.id,
        nome: _nome,
        arma: _arma,
        armadura: _armadura,
        magia: _magia,
        raca: _raca,
      );

      if (widget.personagem == null) {
        await _service.addPersonagem(personagem);
      } else {
        await _service.updatePersonagem(personagem);
      }
      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.personagem == null
              ? 'Adicionar Personagem'
              : 'Editar Personagem')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                initialValue: _nome,
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (value) => value!.isEmpty ? 'Informe o nome' : null,
                onSaved: (value) => _nome = value!,
              ),
              TextFormField(
                initialValue: _arma,
                decoration: const InputDecoration(labelText: 'Arma'),
                validator: (value) => value!.isEmpty ? 'Informe a arma' : null,
                onSaved: (value) => _arma = value!,
              ),
              TextFormField(
                initialValue: _armadura,
                decoration: const InputDecoration(labelText: 'Armadura'),
                validator: (value) =>
                    value!.isEmpty ? 'Informe a armadura' : null,
                onSaved: (value) => _armadura = value!,
              ),
              TextFormField(
                initialValue: _magia,
                decoration: const InputDecoration(labelText: 'Magia'),
                validator: (value) => value!.isEmpty ? 'Informe a magia' : null,
                onSaved: (value) => _magia = value!,
              ),
              TextFormField(
                initialValue: _raca,
                decoration: const InputDecoration(labelText: 'Raça'),
                validator: (value) => value!.isEmpty ? 'Informe a raça' : null,
                onSaved: (value) => _raca = value!,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text(widget.personagem == null ? 'Adicionar' : 'Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
