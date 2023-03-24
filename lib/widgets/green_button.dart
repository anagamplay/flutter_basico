  import 'package:flutter/material.dart';

  class GreenButton extends StatelessWidget {
    //const GreenButton({Key? key}) : super(key: key);

    String text;
    Function onPressed;

    GreenButton(this.text, {required this.onPressed});

    @override
    Widget build(BuildContext context) {
      return ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.green),
        ),
        onPressed: () => onPressed(),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
      );
    }
  }
