import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String resposta;
  final Function()? responder;

  const Resposta(this.resposta, this.responder, {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: responder,
      child: Text(resposta),
    );
  }
}
