import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({Key? key}) : super(key: key);

  static const List<Widget> expandableList = [
    ExpandableListView(
      title: 'Dividendo',
    ),
    ExpandableListView(
      title: 'Especiais',
    ),
    ExpandableListView(
      title: 'Fundos Imobiliários',
    ),
    ExpandableListView(
      title: 'Micro Caps',
    ),
    ExpandableListView(
      title: 'Small Caps',
    ),
    ExpandableListView(
      title: 'IPO\s',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Relatórios'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          )
        ],
      ),
      body: new ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return expandableList[index];
        },
        itemCount: 6,
      ),
    );
  }
}

class ExpandableListView extends StatefulWidget {
  const ExpandableListView({Key? key, this.title}) : super(key: key);
  final String? title;
  static const List<Widget> titleList = [
    Text(
      'MRV (MRVE3).',
      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
    ),
    Text(
      'B3 (B3SA3)',
      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
    ),
    Text(
      'COPASA (CSMG)',
      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
    )
  ];
  @override
  _ExpandableListViewState createState() => new _ExpandableListViewState();
}

class _ExpandableListViewState extends State<ExpandableListView> {
  bool expandFlag = false;
  static const List<Widget> titleList = [
    Text(
      'MRV (MRVE3).',
      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
    ),
    Text(
      'B3 (B3SA3)',
      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
    ),
    Text(
      'COPASA (CSMG)',
      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.symmetric(vertical: 1.0),
      child: new Column(
        children: <Widget>[
          new Container(
            color: Colors.blue,
            padding: new EdgeInsets.symmetric(horizontal: 5.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Container(
                  padding: new EdgeInsets.symmetric(horizontal: 13.0),
                  child: Text(
                    widget.title!,
                    style: new TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                new IconButton(
                    icon: new Container(
                      height: 50.0,
                      width: 50.0,
                      decoration: new BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: new Center(
                        child: new Icon(
                          expandFlag
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          color: Colors.black,
                          size: 30.0,
                        ),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        expandFlag = !expandFlag;
                      });
                    }),
              ],
            ),
          ),
          new ExpandableContainer(
              expanded: expandFlag,
              child: new ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return new Container(
                    decoration: new BoxDecoration(
                        border: new Border.all(width: 1.0, color: Colors.grey),
                        color: Colors.white),
                    child: new ListTile(
                      title: titleList[index],
                      leading: new Icon(
                        Icons.bubble_chart_rounded,
                        color: Colors.black,
                      ),
                    ),
                  );
                },
                itemCount: 3,
              ))
        ],
      ),
    );
  }
}

class ExpandableContainer extends StatelessWidget {
  final bool expanded;
  final double collapsedHeight;
  final double expandedHeight;
  final Widget? child;

  ExpandableContainer({
    this.child,
    this.collapsedHeight = 0.0,
    this.expandedHeight = 300.0,
    this.expanded = true,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return new AnimatedContainer(
      duration: new Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      width: screenWidth,
      height: expanded ? expandedHeight : collapsedHeight,
      child: new Container(
        child: child,
        decoration: new BoxDecoration(
            border: new Border.all(width: 1.0, color: Colors.blue)),
      ),
    );
  }
}
