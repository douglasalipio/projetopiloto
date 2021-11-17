import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_piloto/app/wallet/widgets/wallet_button_widget.dart';
import 'package:projeto_piloto/provider/stocks_data_provider.dart';
import 'package:provider/provider.dart';

class WalletPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Carteira VIP')),
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
          ),
          WalletButtonWidget(
            heading: 'Carteira Fundos Imobiliários High Yield',
            subheading: '6 ativos',
            supportingText:
                'investir no mercado imobiliário. Esta carteira traz FIIS de alta qualidade e com preços atrativos.',
          ),
          WalletButtonWidget(
            heading: 'Carteira Microcaps',
            subheading: '7 ativos',
            supportingText:
                'Inclui pequenas empresas em relação ao seu valor de mercado até RS 1.5 bilhão.',
          ),
          WalletButtonWidget(
            heading: 'Carteira de Small Caps',
            subheading: '7 ativos',
            supportingText:
                'Inclui pequenas empresas em relação ao seu valor de mercado até RS 1.5 bilhão.',
          ),
          WalletButtonWidget(
            heading: 'Carteira TOP 10',
            subheading: '10 ativos',
            supportingText: 'As dez melhores ação selecionada pela VG Research',
          ),
          WalletButtonWidget(
            heading: 'Carteira Value Investing ',
            subheading: '7 ativos',
            supportingText:
                'Considera empresas de altíssima qualidade, líderes de mercado em seus segmentos e com histórico de resultados consistentes. Tudo isso aliado com preço que acreditamos estar baixo.',
          )
        ],
      )),
    );
  }
}
