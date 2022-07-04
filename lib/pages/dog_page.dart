import 'package:flutter/material.dart';
import 'package:projeto001/pages/listview.dart';

class DogPage extends StatelessWidget {
  const DogPage({Key? key, required this.dog}) : super(key: key);

  final Dog dog;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dog.nome),
        backgroundColor: Colors.green,
      ),
      body: Image.asset(dog.foto) ,
    );
  }
}