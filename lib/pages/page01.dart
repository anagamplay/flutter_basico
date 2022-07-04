import 'package:flutter/material.dart';

class Page01 extends StatelessWidget {
  const Page01({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 01'),
        backgroundColor: Colors.green,
        centerTitle: false,
      ),
      body: _image(),
    );
  }
}

_image() {
  return Container(
    margin: EdgeInsets.all(20),
    child: Image.asset(
        "assets/images/photo02.jpg",
        fit: BoxFit.cover,
    ),
  );
}