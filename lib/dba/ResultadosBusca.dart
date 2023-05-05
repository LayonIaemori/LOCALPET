import 'package:flutter/material.dart';
import 'package:localpetdes/dba/DetalhesPet.dart';
import 'package:localpetdes/dba/db_helper.dart';

class ResultadosBusca extends StatelessWidget {
  final List<Pet> pets;

  const ResultadosBusca({Key? key, required this.pets}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> petsMap = pets.map((pet) => pet.toMap()).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text('Resultados da busca'),
      ),
      body: ListView.builder(
        itemCount: petsMap.length,
        itemBuilder: (BuildContext context, int index) {
          Map<String, dynamic> petMap = petsMap[index];
          Pet pet = Pet.fromMap(petMap);
          return ListTile(
            leading: Icon(Icons.pets),
            title: Text(pet.nome),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetalhesPet(pet: pet)),
              );
            },
          );
        },
      ),
    );
  }
}

