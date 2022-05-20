// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  const Labels({Key? key, required this.ruta, required this.txtAcount}) : super(key: key);
  final String ruta;
  final String txtAcount;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const Text(
            'No tienes cuenta?',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 15,
              fontWeight: FontWeight.w300
            ),
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: (){
              Navigator.pushReplacementNamed(context, ruta);
            },
            child: Text(
              txtAcount,
              style: TextStyle(
                color: Colors.blue.shade600,
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),
            ),
          )
        ],
      ),
    );
  }
}