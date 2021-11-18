import 'package:flutter/material.dart';
import 'package:projeto_piloto/model/stock_data.dart';
import 'package:projeto_piloto/provider/stocks_data_provider.dart';
import 'package:provider/provider.dart';

class WalletFiisWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<StocksDataProvider>(
        create: (context) => StocksDataProvider(),
        child: Consumer<StocksDataProvider>(
          builder: (context, provider, child) {
            if (provider.data == null) {
              provider.getData(context);
              return Center(child: CircularProgressIndicator());
            }
            // when we have the json loaded... let's put the data into a data table widget
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              // Data table widget in not scrollable so we have to wrap it in a scroll view when we have a large data set..
              child: SingleChildScrollView(
                child: DataTable(
                  dataRowColor:
                      MaterialStateColor.resolveWith((states) => Colors.white),
                  headingRowColor: MaterialStateColor.resolveWith(
                      (states) => Colors.white12),
                  columns: [
                    DataColumn(
                        label: Text('EMPRESA', textAlign: TextAlign.left),
                        tooltip: 'represents if user is verified.'),
                    DataColumn(
                        label: Text('SETOR', textAlign: TextAlign.center),
                        tooltip: 'represents first name of the user'),
                    DataColumn(
                        label: Text('AÇÃO', textAlign: TextAlign.center),
                        tooltip: 'represents last name of the user'),
                    DataColumn(
                        label: Text('COTAÇÃO', textAlign: TextAlign.center),
                        tooltip: 'represents email address of the user'),
                    DataColumn(
                        label:
                            Text('VARIAÇÃO DIA', textAlign: TextAlign.center),
                        tooltip: 'represents phone number of the user'),
                    DataColumn(
                        label: Text('PREÇO TETO', textAlign: TextAlign.center),
                        tooltip: 'represents phone number of the user'),
                    DataColumn(
                        label: Text('PREÇO JUSTO', textAlign: TextAlign.center),
                        tooltip: 'represents phone number of the user'),
                    DataColumn(
                        label: Text('DATA DA ATUALIZAÇÃO DO VALUATION',
                            textAlign: TextAlign.center),
                        tooltip: 'represents if user is verified.'),
                    DataColumn(
                        label: Text('RISCO'),
                        tooltip: 'represents first name of the user'),
                    DataColumn(
                        label: Text('DIV. YIELD PROJETADO'),
                        tooltip: 'represents last name of the user'),
                    DataColumn(
                        label: Text('INÍCIO DA RECOMENDAÇÃO'),
                        tooltip: 'represents email address of the user'),
                    DataColumn(
                        label: Text('PREÇO DE ENTRADA AJUSTADO'),
                        tooltip: 'represents phone number of the user'),
                    DataColumn(
                        label: Text('RETORNO TOTAL'),
                        tooltip: 'represents phone number of the user'),
                    DataColumn(
                        label: Text('SUGESTÃO'),
                        tooltip: 'represents phone number of the user'),
                    DataColumn(
                        label: Text('DESCONTO P/ TETO'),
                        tooltip: 'represents phone number of the user'),
                    DataColumn(
                        label: Text('POTENCIAL VALORIZAÇÃO'),
                        tooltip: 'represents phone number of the user'),
                    DataColumn(
                        label: Text('DIVULGAÇÃO DE RESULTADOS'),
                        tooltip: 'represents phone number of the user'),
                  ],
                  rows: provider.data!.results
                      .map((data) =>
                          // we return a DataRow every time
                          DataRow(
                              // List<DataCell> cells is required in every row
                              cells: [
                                DataCell(Text(data.empresa,
                                    textAlign: TextAlign.right)),
                                DataCell(Text(data.setor,
                                    textAlign: TextAlign.center)),
                                DataCell(Text(data.acao,
                                    textAlign: TextAlign.center)),
                                DataCell(Text(data.cotacao,
                                    textAlign: TextAlign.center)),
                                DataCell(Text(data.variacao_dia,
                                    textAlign: TextAlign.center)),
                                DataCell(Text(data.preco_teto,
                                    textAlign: TextAlign.right)),
                                DataCell(Text(data.preco_justo)),
                                DataCell(Text(data.data_valuation)),
                                DataCell(Text(data.risco)),
                                DataCell(Text(data.dy_projetado)),
                                DataCell(Text(data.inicio_recomendacao)),
                                DataCell(Text(data.preco_entrada)),
                                DataCell(Text(data.retorno_total)),
                                DataCell(Text(data.sugestao)),
                                DataCell(Text(data.desconto_teto)),
                                DataCell(Text(data.potencial_valor)),
                                DataCell(Text(data.divulgacao)),
                              ]))
                      .toList(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _rowBuild(Results row) {
    return Container();
  }
}
