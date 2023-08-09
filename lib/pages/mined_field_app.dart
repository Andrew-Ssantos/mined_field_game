import 'package:flutter/material.dart';
import 'package:minde_field_game/components/result_widget.dart';

class MinedFieldApp extends StatelessWidget {
  const MinedFieldApp({super.key});

  _restart() {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: ResultWidget(winned: '', onRestart: _restart),
        body: Container(
          child: Text('Tabuleiro'),
        ),
      ),
    );
  }
}
