import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_piloto/app/wallet/widgets/wallet_button_widget.dart';

class WalletPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Carteiras')),
      body: Center(
          child: ListView(
        padding: EdgeInsets.all(19.0),
        children: [
          WalletButtonWidget(
            heading: 'Carteira de dividendos',
            subheading: '9 ativos',
            imageName: 'dividendos_img.png',
            supportingText:
                'É uma carteira que inclui nossas ações preferidas para geração de renda passiva. Inclui tanto ações de bom Dividend Yield histórico como outras em que vemos a possibilidade de pagarem bons dividendos num futuro próximo.',
          ),
          WalletButtonWidget(
            heading: 'Carteira Fundos Imobiliários',
            subheading: '15 ativos',
            imageName: 'building_img.png',
            supportingText:
                ' Fundos imobiliários ou FIIS são uma forma rentável e segura de investir no mercado imobiliário. Esta carteira traz FIIS de alta qualidade e com preços atrativos.',
          )
        ],
      )),
    );
  }
}
