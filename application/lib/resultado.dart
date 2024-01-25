import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() onReiniciar;

  const Resultado(
      {super.key, required this.pontuacao, required this.onReiniciar});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Center(
        child: Text(
          'Parabéns!',
          style: TextStyle(fontSize: 28),
        ),
      ),
      Center(
        child: Text('Sua pontuação foi $pontuacao'),
      ),
      Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue)),
          onPressed: onReiniciar,
          child: const Text('Reiniciar', style: TextStyle(color: Colors.white)),
        ),
      ))
    ]);
  }
}
