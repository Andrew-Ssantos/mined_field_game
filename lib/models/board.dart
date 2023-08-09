import 'dart:math';

import 'package:minde_field_game/models/field.dart';

class Board {
  final int lines;
  final int columns;
  final int qtyOfBombs;

  final List<Field> _fields = [];

  Board({
    required this.lines,
    required this.columns,
    required this.qtyOfBombs,
  }) {
    _createField();
    _relateNeighbors();
    _sortBombs();
  }

  void restart() {
    _fields.forEach((f) => f.restart());
    _sortBombs();
  }

  void revealBombs() {
    _fields.forEach((f) => f.revealBombs());
  }

  void _createField() {
    for (int l = 0; l < lines; l++) {
      for (int c = 0; c < columns; c++) {
        _fields.add(Field(line: l, column: c));
      }
    }
  }

  void _relateNeighbors() {
    for (var field in _fields) {
      for (var neighbor in _fields) {
        field.addNeighbors(neighbor);
      }
    }
  }

  void _sortBombs() {
    int sorted = 0;

    if (qtyOfBombs > lines * columns) {
      return;
    }

    while (sorted < qtyOfBombs) {
      int i = Random().nextInt(_fields.length);

      if (!_fields[i].mined) {
        sorted++;
        _fields[i].undermined();
      }
    }
  }

  List<Field> get fields {
    return _fields;
  }

  bool get resolved {
    return _fields.every((f) => f.resolved);
  }
}
