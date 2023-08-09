import 'package:minde_field_game/models/explosion_exception.dart';

class Field {
  final int line;
  final int column;
  final List<Field> neighbors = [];

  bool _opened = false;
  bool _marked = false;
  bool _mined = false;
  bool _exploded = false;

  Field({
    required this.line,
    required this.column,
  });

  void addNeighbors(Field neighbor) {
    final deltaLine = (line - neighbor.line).abs();
    final deltaColumn = (column - neighbor.column).abs();

    if (deltaLine == 0 && deltaColumn == 0) {
      return;
    }

    if (deltaLine <= 1 && deltaColumn <= 1) {
      neighbors.add(neighbor);
    }
  }

  void openField() {
    if (_opened) {
      return;
    }

    _opened = true;

    if (_mined) {
      _exploded = true;
      throw ExplosionException();
    }
    if (safeNeighborhood) {
      neighbors.forEach((n) => n.openField());
    }
  }

  void revealBombs() {
    if (_mined) {
      _opened = true;
    }
  }

  void undermined() {
    _mined = true;
  }

  void alterMarkation() {
    _marked = !_marked;
  }

  void restart() {
    _opened = false;
    _marked = false;
    _mined = false;
    _exploded = false;
  }

  bool get mined {
    return _mined;
  }

  bool get exploded {
    return _exploded;
  }

  bool get opened {
    return _opened;
  }

  bool get marked {
    return _marked;
  }

  bool get resolved {
    bool minedAndMarked = mined && marked;
    bool safeAndOpened = !mined && opened;
    return minedAndMarked || safeAndOpened;
  }

  bool get safeNeighborhood {
    return neighbors.every((n) => !n._mined);
  }

  int get qtyBombsInNeighborhood {
    return neighbors.where((n) => n.mined).length;
  }
}
