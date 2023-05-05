import 'package:flutter/material.dart';
import 'package:localpetdes/dba/db_helper.dart';

class DetalhesPet extends StatefulWidget {
  final Pet pet;

  DetalhesPet({Key? key, required this.pet}) : super(key: key);


  @override
  _DetalhesPetState createState() => _DetalhesPetState();
}

class _DetalhesPetState extends State<DetalhesPet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes do Pet'),
      ),
      body: Column(
        children: [
          Text('Nome: ${widget.pet.nome}'),
          Text('Raça: ${widget.pet.raca}'),
          Text('Código de Chip: ${widget.pet.codigoChip}'),
        ],
      ),
    );
  }
}
