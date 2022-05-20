// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class BtnBlue extends StatelessWidget {
  const BtnBlue({Key? key, required this.txt, required this.onPress}) : super(key: key);
    final String txt;
    final Function() onPress;
  @override
  Widget build(BuildContext context) {
    return Container(
      // ignore: deprecated_member_use
      child: RaisedButton(
        elevation: 2,
        highlightElevation: 5,
        color: Colors.blue,
        shape: const StadiumBorder(),
        onPressed: onPress,
        child: Container(
          width: double.infinity,
          child: Center(
            child: Text(
              txt,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
            ),
          ),
        ),
      ),

    );
  }
}