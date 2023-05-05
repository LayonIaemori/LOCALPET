import 'package:flutter/material.dart';
import 'package:localpetdes/Pet.dart';
import 'banco/PetDatabaseHelper.dart';

class pesqpet extends StatefulWidget {
  const pesqpet({Key? key}) : super(key: key);

  @override
  _PesqPetState createState() => _PesqPetState();
}

class _PesqPetState extends State<pesqpet> {
  final _formKey = GlobalKey<FormState>();
  final _queryController = TextEditingController();
  final _codigoController = TextEditingController();

  List<Pet> _pets = [];

  @override
  void initState() {
    super.initState();
    // Inicializa o banco de dados
    DatabaseHelper.instance.initializeDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pesquisar pets'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _queryController,
              decoration: InputDecoration(
                hintText: 'Digite o nome, espécie, idade, telefone ou nome do contato',
              ),
            ),
            TextField(
              controller: _codigoController,
              decoration: InputDecoration(
                hintText: 'Digite o código do pet (opcional)',
              ),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: () async {
                String query = _queryController.text;
                int codigo = int.tryParse(_codigoController.text) ?? -1;
                if (codigo < 0) {
                  // Se o código for inválido, busca todos os pets sem filtrar por código
                  List<Pet> pets = await DatabaseHelper.instance.searchPets(query);
                  setState(() {
                    _pets = pets;
                  });
                } else {
                  // Se o código for válido, busca o pet com esse código
                  Pet pet = await DatabaseHelper.instance.getPetById(codigo);
                  setState(() {
                    _pets = pet != null ? [pet] : [];
                  });
                }
              },
              child: Text('Pesquisar'),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: _pets.length,
                itemBuilder: (context, index) {
                  final pet = _pets[index];
                  return ListTile(
                    title: Text(pet.nome),
                    subtitle: Text(pet.especie),
                    trailing: Text(pet.idade.toString()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}