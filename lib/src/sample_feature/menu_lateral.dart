import 'package:flutter/material.dart';
import 'package:link_animal/src/sample_feature/cadastro.dart';
import 'package:link_animal/src/sample_feature/dashboard.dart';
import 'package:link_animal/src/sample_feature/listagem/lista_animais.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 1;

  final List<Widget> _pages = [
    Center(child: AnimalDashboard()),
    // Center(child: GridScreen()),
    Center(child: CadastroCaoScreen()),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // void _

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Link animal')),
      drawer:
          // MediaQuery.of(context).size.width < 600 // Exibir Drawer no mobile
          //?
          Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Link animal', style: TextStyle(color: Colors.white)),
            ),
            ListTile(
              title: const Row(
                children: [
                  Icon(Icons.home),
                  SizedBox(
                    width: 10,
                  ),
                  Text('dash')
                ],
              ),
              onTap: () => _onItemTapped(0),
            ),
            ListTile(
              title: const Row(children: [
                Icon(Icons.pets),
                SizedBox(
                  width: 10,
                ),
                Text('animais')
              ]),
              onTap: () => _onItemTapped(1),
            ),
            ListTile(
              title: const Row(children: [
                Icon(Icons.app_registration),
                SizedBox(
                  width: 10,
                ),
                Text('cadastro')
              ]),
              onTap: () => _onItemTapped(2),
            ),
          ],
        ),
      ),
      // : null,
      body: Row(
        children: [
          if (MediaQuery.of(context).size.width >=
              600) // Exibir NavigationRail no web
            NavigationRail(
              selectedIndex: _selectedIndex,
              onDestinationSelected: _onItemTapped,
              labelType: NavigationRailLabelType.all,
              destinations: [
                NavigationRailDestination(
                  icon: Icon(Icons.home),
                  label: Text('dash'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.pets),
                  label: Text('animais'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.app_registration),
                  label: Text('cadastro'),
                ),
              ],
            ),
          Expanded(
            child: _pages[_selectedIndex],
          ),
        ],
      ),
    );
  }
}
