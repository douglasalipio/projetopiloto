import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'multiplication_table.dart';

final data = [
  "*",
  "BBDC4",
  "20.24",
  "19.22",
  "30.05",
  "55.05",
  "16/08/2021",
  "AAA",
  "22%",
  "16/08/2021",
  "9.76",
  "8.87",
  "21%",
  "COMPRA",
  "33%",
  "-22%",
  "21/02/2021"
];


class WalletFiisWidget extends StatefulWidget {
  const WalletFiisWidget({Key? key}) : super(key: key);

  @override
  _WalletFiisWidgetState createState() => _WalletFiisWidgetState();
}

class _WalletFiisWidgetState extends State<WalletFiisWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: MultiplicationTable(),
      ),
    );
  }
}
