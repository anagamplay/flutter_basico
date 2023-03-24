import 'package:projeto001/drawer_list.dart';
import 'package:projeto001/pages/listview.dart';
import 'package:flutter/material.dart';
import 'package:projeto001/pages/page02.dart';
import 'package:projeto001/pages/page03.dart';
import 'package:projeto001/utils/nav.dart';
import 'package:projeto001/widgets/green_button.dart';
import 'package:fluttertoast/fluttertoast.dart';

// Criaremos um Scaffold para cada tela
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Hello, Flutter!',
          ),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Tab 1'),
              Tab(text: 'Tab 2'),
              Tab(text: 'Tab 3'),
            ],
          ),
          centerTitle: false,
          backgroundColor: Colors.green,
        ),
        body: TabBarView(children: [
          _body(context),
          Container(
            color: Colors.orange[700],
          ),
          Container(
            color: Colors.blue,
          )
        ],),
        floatingActionButton: _floatingB(),
        drawer: const DrawerList(),
      ),
    );
  }

  _floatingB() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: (){
          _onClickFab();
          },
          child: const Icon(Icons.add),
        ),
        const SizedBox(
          height: 8,
        ),
        FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: (){
          _onClickFab();
          },
          child: const Icon(Icons.favorite),
        ),
      ]
    );
  }

  _onClickFab() {
    print('Adicionar');
  }
}

_body(context) {
  return Container(
    padding: const EdgeInsets.only(top: 16),
    color: Colors.white,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        _text(),
        _pageView(),
        _buttons(),
      ],
    ),
  );
}

_text() {
  return const Text(
    'Hello, Word!',
    style: TextStyle(
      fontSize: 30,
      color: Colors.green,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
      decorationStyle: TextDecorationStyle.dotted,
    ),
  );
}

_pageView() {
  return Container(
    margin: const EdgeInsets.only(top: 20, bottom: 20),
    height: 400,
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

_image(String img) {
  return Container(
    margin: const EdgeInsets.all(20),
    child: Image.asset(
      img,
      fit: BoxFit.cover,
    ),
  );
}

_buttons() {
  return Builder(
    builder: (context) {
      return Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GreenButton("ListView",
                  onPressed: () => _onClickNavigator(context, const Listview())),
              GreenButton("Expanded",
                  onPressed: () => _onClickNavigator(context, const Page02())),
              GreenButton("Page 3",
                  onPressed: () => _onClickNavigator(context, const Page03())),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GreenButton("Snack", onPressed: () => _onClickSnack(context)),
              GreenButton("Dialog", onPressed: () => _onClickDialog(context)),
              GreenButton("Toast", onPressed: _onClickToast),
            ],
          ),
        ],
      );
    },
  );
}

void _onClickNavigator(BuildContext context, Widget page) async {
  String s = await push(context, page);
  print('>> $s');
}

// Alerts:
_onClickSnack(context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: const Text('Olá Flutter!'),
      action: SnackBarAction(
        textColor: Colors.green,
        label: 'OK',
        onPressed: () {
          print('Ok!');
        },
      ),
    ),
  );
}

_onClickDialog(context) {
  showDialog(
    barrierDismissible: false, // Para não fechar quando clicar fora
    context: context,
    builder: (context) {
      return WillPopScope(
        onWillPop: () async => false, // Se apertar no botao de voltar nao fecha
        child: AlertDialog(
          title: const Text('Flutter é muito legal!'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.pop(context);
                print('Ok');
              },
            ),
          ],
        ),
      );
    },
  );
}

_onClickToast() {
  Fluttertoast.showToast(
    msg: "Hello Flutter!",
    toastLength: Toast.LENGTH_LONG, // Para controlar o tempo no Android
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 5, // Para controlar o tempo no IOS
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}