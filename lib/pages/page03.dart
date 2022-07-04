import 'package:flutter/material.dart';
import 'package:projeto001/widgets/green_button.dart';

class Page03 extends StatelessWidget {
  const Page03({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 3'),
        backgroundColor: Colors.green,
        centerTitle: false,
      ),
      body: _body(context),
    );
  }

  _body(context) {
    return Center(
      child: GreenButton(
        'Voltar',
        onPressed: () => _onClickVoltar(context),
      ),
    );
  }

  _onClickVoltar(context) {
    Navigator.pop(context, 'Tela 3');
  }
}