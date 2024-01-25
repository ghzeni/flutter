import 'package:application/questionario.dart';
import 'package:application/resultado.dart';
import 'package:flutter/material.dart';

main() {
  runApp(PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  int _pontuacaoTotal = 0;

  // List<Map<String, Object>>
  final _perguntas = const [
    {
      'text': 'Qual é a sua cor favorita?',
      'respostas': [
        {'text': 'Preto', 'score': 5},
        {'text': 'Vermelho', 'score': 10},
        {'text': 'Verde', 'score': 3},
        {'text': 'Branco', 'score': 7},
      ]
    },
    {
      'text': 'Qual é o seu animal favorito?',
      'respostas': [
        {'text': 'Cachorro', 'score': 1},
        {'text': 'Gato', 'score': 2},
        {'text': 'Coelho', 'score': 3},
        {'text': 'Cavalo', 'score': 6},
      ]
    },
    {
      'text': 'Qual é o seu instrutor favorito?',
      'respostas': [
        {'text': 'Maria', 'score': 10},
        {'text': 'João', 'score': 5},
        {'text': 'Leo', 'score': 2},
        {'text': 'Pedro', 'score': 10},
      ]
    },
  ];

  void _responder(int pontuacao) {
    setState(() {
      _perguntaSelecionada++;
      _pontuacaoTotal += pontuacao;
    });
  }

  void _reiniciar() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  // getter?
  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('Perguntas'),
      ),
      body: temPerguntaSelecionada
          ? Questionario(
              perguntaSelecionada: _perguntaSelecionada,
              perguntas: _perguntas,
              responder: _responder,
            )
          : Resultado(
              pontuacao: _pontuacaoTotal,
              onReiniciar: _reiniciar,
            ),
    ));
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
