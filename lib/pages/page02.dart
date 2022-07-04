import 'package:flutter/material.dart';
import 'package:projeto001/widgets/green_button.dart';

class Page02 extends StatelessWidget {
  const Page02({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expanded'),
        backgroundColor: Colors.green,
        centerTitle: false,
      ),
      body: _body(context),
    );
  }

  _body(context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 6,
          child: _pageView(),
        ),
        Expanded(
          flex: 4,
          child: _pageView(),
        )
      ],
    );
  }

  _image(String img) {
    return Container(
      //margin: EdgeInsets.all(20),
      child: Image.asset(
        img,
        fit: BoxFit.cover,
      ),
    );
  }

  _pageView() {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 5, left: 10, right: 10),
      height: 300,
      child: PageView(
        children: <Widget>[
          _image('assets/images/photo01.jpg'),
          _image('assets/images/photo02.jpg'),
          _image('assets/images/photo03.jpg'),
          _image('assets/images/photo04.jpg'),
          _image('assets/images/photo05.jpg'),
        ],
      ),
    );
  }
}