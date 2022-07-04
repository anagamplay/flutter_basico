import 'package:flutter/material.dart';
import 'package:projeto001/pages/dog_page.dart';
import 'package:projeto001/utils/nav.dart';

class Dog {
  String nome;
  String foto;

  Dog(this.nome, this.foto);
}

class Listview extends StatefulWidget {
  const Listview({Key? key}) : super(key: key);

  @override
  State<Listview> createState() => _ListviewState();
}

class _ListviewState extends State<Listview> {
  bool _gridView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView'),
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: (){
              print('Lista');
              setState(() {
                _gridView = false;
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.grid_on),
            onPressed: (){
              print('Grid');
              setState((){
                _gridView = true;
              });
            },
          )
        ],
      ),
      body: _body(),
    );
  }

  _body() {
    List<Dog> dogs = [
      Dog('Gato Laranja', 'assets/images/photo01.jpg'),
      Dog('Cachorro Malhado', 'assets/images/photo02.jpg'),
      Dog('Cachorro Marrom', 'assets/images/photo03.jpg'),
      Dog('Gatinho', 'assets/images/photo04.jpg'),
      Dog('Filhote', 'assets/images/photo05.jpg'),
    ];

    if(_gridView) {
      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: dogs.length,
        itemBuilder: (context, index) {
          return _itemView(dogs, index);
        },
      );
    } else {
      return ListView.builder(
        itemExtent: 350,
        itemCount: dogs.length,
        itemBuilder: (context, index) {
          return _itemView(dogs, index);
        },
      );
    }
  }

  GestureDetector _itemView(List<Dog> dogs, int index) {
    Dog dog = dogs[index];

    return GestureDetector(
      onTap: () {
        push (context, DogPage(dog: dog));
      },
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          _image(dog.foto),
          Container(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10,),
              decoration: BoxDecoration(
                color: Colors.black45,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                dog.nome,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _image(String img) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 5, left: 10, right: 10),
      child: Image.asset(
        img,
        fit: BoxFit.cover,
      ),
    );
  }
}