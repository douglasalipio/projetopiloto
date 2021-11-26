import 'package:flutter/material.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:projeto_piloto/app/wallet/widgets/wallet_fiis_table_body.dart';
import 'package:projeto_piloto/app/wallet/widgets/wallet_fiis_table_head.dart';

class MultiplicationTable extends StatefulWidget {
  @override
  _MultiplicationTableState createState() => _MultiplicationTableState();
}

class _MultiplicationTableState extends State<MultiplicationTable> {
  final _controllers = LinkedScrollControllerGroup();
  late ScrollController _headController;
  late ScrollController _bodyController;

  @override
  void initState() {
    super.initState();
    _headController = _controllers.addAndGet();
    _bodyController = _controllers.addAndGet();
  }

  @override
  void dispose() {
    _headController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableHead(
          scrollController: _headController,
        ),
        Expanded(
          child: TableBody(
            scrollController: _bodyController,
          ),
        ),
      ],
    );
  }
}
