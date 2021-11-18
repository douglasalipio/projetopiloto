import 'package:flutter/material.dart';
import 'package:projeto_piloto/app/wallet/widgets/wallet_fiis_widget.dart';

class WalletDetailPage extends StatelessWidget {
  const WalletDetailPage({Key? key, this.heading}) : super(key: key);

  final String? heading;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(heading!),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: WalletFiisWidget(),
        ),
      ),
    );
  }
}
