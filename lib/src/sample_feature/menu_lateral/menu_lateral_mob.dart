import 'package:flutter/material.dart';
import 'package:link_animal/src/sample_feature/menu_lateral/menus.dart';
import 'package:link_animal/src/shared/global_context.dart';

class MenuLateralMob extends StatelessWidget {
  const MenuLateralMob({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(padding: EdgeInsets.zero, children: <Widget>[
        const DrawerHeader(
          decoration: BoxDecoration(color: Colors.blue),
          child: Text('Link animal', style: TextStyle(color: Colors.white)),
        ),
        ...menus.entries.map((menu) {
          return ListTile(
            leading: Icon(menu.value.icone),
            title: Text(menu.value.nome),
            onTap: () {
              GlobalContext.nav.pushReplacementNamed(menu.key);
              // GlobalContext.nav.pop();
            },
          );
        })
      ]

          //  menus.entries.map((menu) {
          //   return ListTile(
          //     leading: Icon(menu.value.icone),
          //     title: Text(menu.value.nome),
          //     onTap: () {
          //       GlobalContext.nav.pushReplacementNamed(menu.key);
          //       // GlobalContext.nav.pop();
          //     },
          //   );
          // }).toList()
          // ],
          ),
    );
  }
}
