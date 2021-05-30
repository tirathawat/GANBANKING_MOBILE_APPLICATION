import 'package:flutter/material.dart';

class Defaultbutton extends StatelessWidget {
  final Text text;
  final Color color;
  final Function onPress;

  const Defaultbutton({
    Key key,
    @required this.text,
    @required this.color,
    @required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(
            vertical: 15,
          ),
        ),
        minimumSize: MaterialStateProperty.all(Size(double.infinity, 0)),
        backgroundColor: MaterialStateProperty.all(color),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      ),
      onPressed: () {
        onPress();
      },
      child: text,
    );
  }
}
