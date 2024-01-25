import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String resposta;
  final void Function() onSelected;

  const Resposta(this.resposta, this.onSelected, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue)),
          onPressed: onSelected,
          child: Text(
            resposta,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
