import 'package:fire3_22072025/provider/auth_service.dart';
import 'package:provider/provider.dart';

import 'pages/home.dart';
import 'pages/more.dart';

import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});

  final List<Widget> _pages = [Home(), More()];

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appstate, child) => Scaffold(
        appBar: AppBar(title: Text('Dashboard'), centerTitle: true),
        body: _pages[appstate.selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: appstate.selectedIndex,
          onTap: (index) {
            appstate.selectedIndex = index;
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: "More"),
          ],
        ),
      ),
    );
  }
}
