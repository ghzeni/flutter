import 'package:application/questao.dart';
import 'package:application/resposta.dart';
import 'package:flutter/material.dart';

// stateless -> final
class Questionario extends StatelessWidget {
  final int perguntaSelecionada;
  final List<Map<String, Object>> perguntas;
  // recebe um parâmetro tipo int
  final void Function(int) responder;

  const Questionario({
    super.key,
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.responder,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada]['respostas']
            as List<Map<String, Object>>
        : [];
    return Column(children: <Widget>[
      Questao(perguntas[perguntaSelecionada]['text'].toString()),
      ...respostas
          .map((resposta) => Resposta(
              resposta['text'] as String,
              // passar função por parâmetro
              () => responder(resposta['score'] as int)))
          .toList(),
    ]);
  }
}
