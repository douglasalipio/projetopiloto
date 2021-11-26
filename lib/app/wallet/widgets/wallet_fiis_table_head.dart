import 'package:flutter/material.dart';
import 'package:projeto_piloto/app/wallet/widgets/wallet_fiis_table_cell.dart';

const int maxNumber = 18;
final heads = [
  'Setor',
  'Ação',
  'Cotação',
  'Variação dia',
  'Preço teto',
  'Preço justo',
  'Variação dia',
  'Alocação %',
  'Risco',
  'Div. projetado',
  'Inicio recomendação',
  'Preço/entrada ajustado',
  'Retorno total',
  'Sugestão',
  'Desconto p/tento',
  'Potencial valorização',
  'Div resultado'
];

final companies = [
  'assets/bb.jpeg',
  'assets/banrisul.jpeg',
  'assets/bradesco.jpeg',
  'assets/sanepar.jpeg',
  'assets/iridium.jpeg',
  'assets/petrobras.jpeg',
  'assets/bmg.jpeg',
  'assets/cvc.jpeg',
  'assets/tegma.jpeg',
  'assets/viavarejo.jpeg',
];

class TableHead extends StatelessWidget {
  late final ScrollController scrollController;

  TableHead({required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: cellWidth,
      child: Row(
        children: [
          MultiplicationTableCell(
            color: Colors.blue.withOpacity(0.3),
            value: "Empresa",
            textStyle: TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: ListView(
              controller: scrollController,
              physics: ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: List.generate(maxNumber - 1, (index) {
                return MultiplicationTableCell(
                  color: Colors.blue.withOpacity(0.3),
                  value: heads[index],
                  textStyle: TextStyle(fontWeight: FontWeight.bold),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
