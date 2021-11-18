import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_piloto/app/wallet/widgets/wallet_button_widget.dart';
import 'package:projeto_piloto/provider/stocks_data_provider.dart';
import 'package:provider/provider.dart';

class WalletPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Carteiras')),
      body: Center(
          child: ListView(
        padding: EdgeInsets.all(15.0),
        children: [
          WalletButtonWidget(
            heading: 'Carteira Fundos Imobiliários',
            subheading: '15 ativos',
            supportingText:
                ' Fundos imobiliários ou FIIS são uma forma rentável e segura de investir no mercado imobiliário. Esta carteira traz FIIS de alta qualidade e com preços atrativos.',
          ),
          WalletButtonWidget(
            heading: 'Carteira de dividendos',
            subheading: '9 ativos',
            supportingText:
                'É uma carteira que inclui nossas ações preferidas para geração de renda passiva. Inclui tanto ações de bom Dividend Yield histórico como outras em que vemos a possibilidade de pagarem bons dividendos num futuro próximo.',
          )
        ],
      )),
    );
  }
}
