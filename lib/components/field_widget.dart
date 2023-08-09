import 'package:flutter/material.dart';
import 'package:minde_field_game/models/field.dart';

class FieldWidget extends StatelessWidget {
  final Field field;
  final void Function(Field) onOpen;
  final void Function(Field) onAlternateMarkation;

  const FieldWidget({
    super.key,
    required this.field,
    required this.onOpen,
    required this.onAlternateMarkation,
  });

  Widget _getFieldContent() {
    int qtyOfBombs = field.qtyBombsInNeighborhood;

    if (field.opened && field.mined && field.exploded) {
      return Image.asset('assets/images/bomba_0.jpeg');
    } else if (field.opened && field.mined) {
      return Image.asset('assets/images/bomba_1.jpeg');
    } else if (field.opened) {
      return Image.asset('assets/images/aberto_$qtyOfBombs.jpeg');
    } else if (field.marked) {
      return Image.asset('assets/images/bandeira.jpeg');
    } else {
      return Image.asset('assets/images/fechado.jpeg');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onOpen(field),
      onLongPress: () => onAlternateMarkation(field),
      child: _getFieldContent(),
    );
  }
}
