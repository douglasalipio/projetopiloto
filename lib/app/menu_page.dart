import 'package:flutter/material.dart';
import 'package:projeto_piloto/app/report/report_page.dart';
import 'package:projeto_piloto/app/wallet/widgets/wallet_fiis_widget.dart';
import 'package:projeto_piloto/app/wallet/pages/wallet_page.dart';

/// This is the stateful widget that the main application instantiates.
class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MenuPageState extends State<MenuPage> {
  int _selectedIndex = 0;
  final List _widgetOptions = [
    WalletPage(),
    ReportPage(),
    Container(),
    Container()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Carteiras',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart),
            label: 'Relatório',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Material',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Colors.blue,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.yellow,
        onTap: _onItemTapped,
      ),
    );
  }
}
