import 'package:flutter/material.dart';
import 'package:minde_field_game/components/board_widget.dart';
import 'package:minde_field_game/components/result_widget.dart';
import 'package:minde_field_game/models/board.dart';
import 'package:minde_field_game/models/explosion_exception.dart';
import 'package:minde_field_game/models/field.dart';

class MinedFieldApp extends StatefulWidget {
  const MinedFieldApp({super.key});

  @override
  State<MinedFieldApp> createState() => _MinedFieldAppState();
}

class _MinedFieldAppState extends State<MinedFieldApp> {
  String _winned = '';
  Board _board = Board(
    lines: 0,
    columns: 0,
    qtyOfBombs: 0,
  );

  void _restart() {
    setState(() {
      _winned = '';
      _board.restart();
    });
  }

  void _open(Field field) {
    if (_winned != '') {
      return;
    }
    setState(() {
      try {
        field.openField();
        if (_board.resolved) {
          _winned = 'win';
        }
      } on ExplosionException {
        _winned = 'lose';
        _board.revealBombs();
      }
    });
  }

  void _alternateMarkation(Field field) {
    if (_winned != '') {
      return;
    }
    setState(() {
      field.alterMarkation();
      if (_board.resolved) {
        _winned = 'win';
      }
    });
  }

  Board _getBoard(double width, double height) {
    if (_board == Board(columns: 0, lines: 0, qtyOfBombs: 0)) {
      int qtyOfColumns = 15;
      double fieldSize = (width / qtyOfColumns);
      int qtyOfLines = (height / fieldSize).floor();

      _board = Board(
        lines: qtyOfLines,
        columns: qtyOfColumns,
        qtyOfBombs: 7,
      );
    }
    return _board;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: ResultWidget(winned: _winned, onRestart: _restart),
        body: LayoutBuilder(
          builder: ((context, constraints) {
            return BoardWidget(
              board: _getBoard(constraints.maxWidth, constraints.maxHeight),
              onOpen: _open,
              onAlternateMarkation: _alternateMarkation,
            );
          }),
        ),
      ),
    );
  }
}
