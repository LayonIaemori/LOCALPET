import 'dart:math';

import 'package:flutter/material.dart';
import 'package:localpetdes/Pet.dart';

import 'package:sqflite/sqflite.dart';
import 'banco/PetDatabaseHelper.dart';
///////////////////////////////QRCODE
import 'utils.dart';


class cadaspet extends StatefulWidget {
  const cadaspet({Key? key}) : super(key: key);

  @override
  _CadasPetState createState() => _CadasPetState();
}

class _CadasPetState extends State<cadaspet> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _especieController = TextEditingController();
  final _idadeController = TextEditingController();
  final _telefoneController = TextEditingController();
  final _nomecontatoController = TextEditingController();
  final _petDatabaseHelper = DatabaseHelper.instance;

  int _codigo = 0; // adicionando uma nova variável para armazenar o código de ID

  int _generateRandomNumber() {
    final random = Random();
    _codigo = random.nextInt(999); // armazenando o número gerado aleatoriamente na variável de classe
    return _codigo;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar Pet'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: _nomeController,
                decoration: InputDecoration(
                  labelText: 'Nome',
                  hintText: 'Digite o nome do pet',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, digite o nome do pet';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _especieController,
                decoration: InputDecoration(
                  labelText: 'Espécie',
                  hintText: 'Digite a espécie do pet',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, digite a espécie do pet';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _idadeController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Idade',
                  hintText: 'Digite a idade do pet',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, digite a idade do pet';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Por favor, digite um número válido';
                  }
                  return null;
                },
              ),
              ////////////////TELEFONE
              TextFormField(
                controller: _telefoneController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Telefone',
                  hintText: 'Digite o telefone do dono',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, digite o telefone do dono';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Por favor, digite um número válido';
                  }
                  return null;
                },
              ),

              ///////////////////TELEFONE
              //////////////////NOMECONTATO
              TextFormField(
                controller: _nomecontatoController,
                decoration: InputDecoration(
                  labelText: 'Nome do dono',
                  hintText: 'Digite o nome do dono do pet',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, digite o nome do dono do pet';
                  }
                  return null;
                },
              ),
              /////////////////NOMECONTATO
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),

                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      // Insere um novo pet no banco de dados
                      await _petDatabaseHelper.insertPet({
                        'nome': _nomeController.text,
                        'especie': _especieController.text,
                        'idade': int.parse(_idadeController.text),
                        'telefone': int.parse(_telefoneController.text),
                        'nomecontato': _nomecontatoController.text,
                        'codigo': _generateRandomNumber(), // chamando o método para gerar o número aleatório
                      });
                      // Busca o último pet cadastrado
                      final lastPet = await _petDatabaseHelper.getLastInsertedPet();
                      // Exibir o código na tela
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('O ID do seu pet é ${lastPet.id}'),
                        ),
                      );
                      // Volta para a tela anterior
                      Navigator.pop(context);
                    }
                  },
                  child: Text('Cadastrar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}