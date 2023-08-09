import 'package:flutter/material.dart';
import 'package:minde_field_game/components/field_widget.dart';
import 'package:minde_field_game/models/board.dart';
import 'package:minde_field_game/models/field.dart';

class BoardWidget extends StatelessWidget {
  final Board board;
  final void Function(Field) onOpen;
  final void Function(Field) onAlternateMarkation;

  const BoardWidget({
    super.key,
    required this.board,
    required this.onOpen,
    required this.onAlternateMarkation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: board.columns,
        children: board.fields.map((f) {
          return FieldWidget(
            field: f,
            onOpen: onOpen,
            onAlternateMarkation: onAlternateMarkation,
          );
        }).toList(),
      ),
    );
  }
}
