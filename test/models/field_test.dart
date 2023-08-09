import 'package:flutter_test/flutter_test.dart';
import 'package:minde_field_game/models/field.dart';

main() {
  group('Field', () {
    test('Abrir Campo COM explosão', () {
      Field f = Field(line: 0, column: 0);
      f.undermined();

      expect(f.openField, throwsException);
    });
    test('Abrir Campo SEM explosão', () {
      Field f = Field(line: 0, column: 0);
      f.openField();

      expect(f.opened, isTrue);
    });
    test('Adicionar NÃO vizinho', () {
      Field f1 = Field(line: 0, column: 0);
      Field f2 = Field(line: 1, column: 3);
      f1.addNeighbors(f2);

      expect(f1.neighbors.isEmpty, isTrue);
    });
    test('Adicionar vizinho', () {
      Field f1 = Field(line: 3, column: 3);
      Field f2 = Field(line: 3, column: 4);
      Field f3 = Field(line: 2, column: 2);
      Field f4 = Field(line: 4, column: 4);
      f1.addNeighbors(f2);
      f1.addNeighbors(f3);
      f1.addNeighbors(f4);

      expect(f1.neighbors.length, 3);
    });

    test('Minas na vizinhança', () {
      Field f1 = Field(line: 3, column: 3);
      Field f2 = Field(line: 3, column: 4);
      f2.undermined();
      Field f3 = Field(line: 2, column: 2);
      f3.undermined();
      Field f4 = Field(line: 4, column: 4);

      f1.addNeighbors(f2);
      f1.addNeighbors(f3);
      f1.addNeighbors(f4);

      expect(f1.qtyBombsInNeighborhood, 2);
    });
  });
}
