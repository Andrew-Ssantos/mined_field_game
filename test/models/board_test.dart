import 'package:flutter_test/flutter_test.dart';
import 'package:minde_field_game/models/board.dart';

void main() {
  test('Ganhar jogo', () {
    Board board = Board(lines: 2, columns: 2, qtyOfBombs: 0);

    board.fields[0].undermined();
    board.fields[3].undermined();

    board.fields[0].alterMarkation();
    board.fields[1].openField();
    board.fields[2].openField();
    board.fields[3].alterMarkation();

    expect(board.resolved, isTrue);
  });
}
