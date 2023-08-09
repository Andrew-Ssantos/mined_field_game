import 'package:flutter/material.dart';

class ResultWidget extends StatelessWidget implements PreferredSizeWidget {
  String winned;
  void Function() onRestart;

  ResultWidget({
    required this.winned,
    required this.onRestart,
  });

  Color? _getColor() {
    if (winned == '') {
      return Colors.yellow;
    } else if (winned == 'win') {
      return Colors.green[300];
    } else {
      return Colors.red[300];
    }
  }

  IconData _getIcon() {
    if (winned == '') {
      return Icons.sentiment_satisfied_alt_rounded;
    } else if (winned == 'win') {
      return Icons.sentiment_very_satisfied_rounded;
    } else {
      return Icons.sentiment_very_dissatisfied_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          child: CircleAvatar(
            backgroundColor: _getColor(),
            child: IconButton(
              padding: EdgeInsets.all(0),
              icon: Icon(
                _getIcon(),
                color: Colors.black,
                size: 35,
              ),
              onPressed: onRestart,
            ),
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(120);
}
