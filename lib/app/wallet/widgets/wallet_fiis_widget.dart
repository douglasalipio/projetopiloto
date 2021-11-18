import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:horizontal_data_table/refresh/hdt_refresh_controller.dart';
import 'package:projeto_piloto/model/stock_data.dart';
import 'package:projeto_piloto/provider/stocks_data_provider.dart';
import 'package:provider/provider.dart';

class WalletFiisWidget extends StatefulWidget {
  const WalletFiisWidget({Key? key}) : super(key: key);

  @override
  _WalletFiisWidgetState createState() => _WalletFiisWidgetState();
}

class _WalletFiisWidgetState extends State<WalletFiisWidget> {
  HDTRefreshController _hdtRefreshController = HDTRefreshController();
  StockData? stockData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getBodyWidget(),
    );
  }

  Widget _getBodyWidget() {
    return ChangeNotifierProvider<StocksDataProvider>(
      create: (context) => StocksDataProvider(),
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: Consumer<StocksDataProvider>(
          builder: (context, provider, child) {
            return HorizontalDataTable(
              leftHandSideColumnWidth: 100,
              rightHandSideColumnWidth: 600,
              isFixedHeader: true,
              headerWidgets: _getTitleWidget(provider.data),
              leftSideItemBuilder: _generateFirstColumnRow,
              rightSideItemBuilder: _generateRightHandSideColumnRow,
              itemCount:
                  provider.data != null ? provider.data!.results.length : 0,
              rowSeparatorWidget: Divider(
                color: Colors.black54,
                height: 1.0,
                thickness: 0.0,
              ),
              leftHandSideColBackgroundColor: Colors.white30,
              rightHandSideColBackgroundColor: Colors.white,
              verticalScrollbarStyle: ScrollbarStyle(
                isAlwaysShown: true,
                thickness: 4.0,
                radius: Radius.circular(5.0),
              ),
              horizontalScrollbarStyle: ScrollbarStyle(
                isAlwaysShown: true,
                thickness: 4.0,
                radius: Radius.circular(5.0),
              ),
              enablePullToRefresh: false,
              refreshIndicator: const WaterDropHeader(),
              refreshIndicatorHeight: 60,
              onRefresh: () async {
                //Do sth
                await Future.delayed(Duration(milliseconds: 500));
                _hdtRefreshController.refreshCompleted();
              },
              htdRefreshController: _hdtRefreshController,
            );
          },
        ),
      ),
    );
  }

  List<Widget> _getTitleWidget(StockData? stockData) {
    return [
      _getTitleItemWidget('Empresa', 200),
      _getTitleItemWidget('Setor', 100),
      _getTitleItemWidget('Ação', 200),
      _getTitleItemWidget('Cotação', 200),
      _getTitleItemWidget('Variação dia', 200),
      _getTitleItemWidget('Preço teto', 200),
      _getTitleItemWidget('Preço justo', 200),
      _getTitleItemWidget('Variação dia', 200),
      _getTitleItemWidget('Alocação sugerida (% na carteira)', 200),
      _getTitleItemWidget('Atualização do valuation', 200),
      _getTitleItemWidget('Risco', 100),
      _getTitleItemWidget('Div. yield projetado', 200),
      _getTitleItemWidget('Inicio da recomendação', 200),
      _getTitleItemWidget('Preço de entrada ajustado', 200),
      _getTitleItemWidget('Retorno total', 200),
      _getTitleItemWidget('Sugestão', 100),
      _getTitleItemWidget('Desconto p/tento', 200),
      _getTitleItemWidget('Potencial valorização', 200),
      _getTitleItemWidget('Divulgação de resultado', 200),
    ];
  }

  Widget _getTitleItemWidget(String label, double width) {
    return Container(
      child: Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
      width: 100,
      height: 56,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    );
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    return Container(
      child: Text(stockData != null ? stockData!.results[index].empresa : ""),
      width: 100,
      height: 52,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    );
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    return Row(
      children: <Widget>[
        Container(
          child: Text(stockData != null ? stockData!.results[index].setor : ""),
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Text(stockData != null ? stockData!.results[index].setor : ""),
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Text(stockData != null ? stockData!.results[index].acao : ""),
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child:
              Text(stockData != null ? stockData!.results[index].cotacao : ""),
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Text(
              stockData != null ? stockData!.results[index].variacao_dia : ""),
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Text(
              stockData != null ? stockData!.results[index].preco_teto : ""),
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Text(
              stockData != null ? stockData!.results[index].preco_justo : ""),
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Text(stockData != null
              ? stockData!.results[index].data_valuation
              : ""),
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Text(stockData != null ? stockData!.results[index].risco : ""),
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Text(
              stockData != null ? stockData!.results[index].dy_projetado : ""),
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Text(stockData != null
              ? stockData!.results[index].inicio_recomendacao
              : ""),
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Text(
              stockData != null ? stockData!.results[index].preco_entrada : ""),
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Text(
              stockData != null ? stockData!.results[index].retorno_total : ""),
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child:
              Text(stockData != null ? stockData!.results[index].sugestao : ""),
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Text(
              stockData != null ? stockData!.results[index].desconto_teto : ""),
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Text(stockData != null
              ? stockData!.results[index].potencial_valor
              : ""),
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Text(
              stockData != null ? stockData!.results[index].divulgacao : ""),
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
      ],
    );
  }
}
