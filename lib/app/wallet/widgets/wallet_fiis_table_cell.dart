import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final double cellWidth = 78;

class MultiplicationTableCell extends StatelessWidget {
  late final String value;
  late final Color color;

  MultiplicationTableCell({
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: cellWidth,
      height: cellWidth,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(
          color: Colors.black12,
          width: 1.0,
        ),
      ),
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.all(3.0),
        child: _setColorField()
      ),
    );
  }

  Widget _setColorField() {
    if (value == "COMPRA") {
      return Text(
        '${value ?? ''}',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 13.0, color: Colors.green));
    } else {
      return Text(
        '${value ?? ''}',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 13.0),
      );
    }
  }
}
