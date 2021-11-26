import 'package:flutter/material.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:projeto_piloto/app/wallet/widgets/wallet_fiis_table_cell.dart';
import 'package:projeto_piloto/app/wallet/widgets/wallet_fiis_table_head.dart';
import 'package:projeto_piloto/app/wallet/widgets/wallet_fiis_widget.dart';

class TableBody extends StatefulWidget {
  final ScrollController scrollController;

  TableBody({
    required this.scrollController,
  });

  @override
  _TableBodyState createState() => _TableBodyState();
}

class _TableBodyState extends State<TableBody> {
  final _controllers = LinkedScrollControllerGroup();
  late ScrollController _firstColumnController;
  late ScrollController _restColumnsController;

  @override
  void initState() {
    super.initState();
    _firstColumnController = _controllers.addAndGet();
    _restColumnsController = _controllers.addAndGet();
  }

  @override
  void dispose() {
    _firstColumnController.dispose();
    _restColumnsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      notificationPredicate: (ScrollNotification notification) {
        return notification.depth == 0 || notification.depth == 1;
      },
      onRefresh: () async {
        await Future.delayed(
          Duration(seconds: 2),
        );
      },
      child: Row(
        children: [
          SizedBox(
            width: cellWidth,
            child: ListView(
              controller: _firstColumnController,
              physics: const AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics(),
              ),
              children: List.generate(10, (index) {
                return Container(
                    width: cellWidth,
                    height: cellWidth,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12,
                        width: 1.0,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: IconButton(icon: Image.asset(companies[index]), onPressed: () {  },)
                ));
              }),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: widget.scrollController,
              scrollDirection: Axis.horizontal,
              physics: const ClampingScrollPhysics(),
              child: SizedBox(
                width: (maxNumber - 1) * cellWidth,
                child: ListView(
                  controller: _restColumnsController,
                  physics: const AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics(),
                  ),
                  children: List.generate(10, (y) {
                    return Row(
                      children: List.generate(maxNumber - 1, (x) {
                        return MultiplicationTableCell(
                          value: data[x],
                          color: Colors.white,
                          textStyle: TextStyle(),
                        );
                      }),
                    );
                  }),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _cellsWidget() {
    List<MultiplicationTableCell> cells = List.empty(growable: true);
    for (var i = 0; i >= data.length; i++) {
      cells.add(MultiplicationTableCell(
        value: data[i],
        color: Colors.white,
        textStyle: TextStyle(),
      ));
    }
    return cells;
  }
}
