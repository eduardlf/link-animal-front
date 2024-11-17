import 'package:flutter/material.dart';
import 'package:link_animal/src/sample_feature/home.dart';
import 'package:link_animal/src/sample_feature/menu_lateral/menus.dart';
import 'package:link_animal/src/shared/global_context.dart';

class MenuLateralWeb extends StatelessWidget {
  final AppRouterHome appRouterHome;

  const MenuLateralWeb({super.key, required this.appRouterHome});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: appRouterHome, // Escuta mudanças no AppRouterHome
        builder: (context, _) {
          final itemSelecionado =
              menus.keys.contains(appRouterHome.currentRoute)
                  ? menus.keys
                      .toList()
                      .indexWhere((r) => r == appRouterHome.currentRoute)
                  : null;
          return NavigationRail(
            selectedIndex: itemSelecionado,
            useIndicator: true,
            labelType: NavigationRailLabelType.all,
            onDestinationSelected: (index) {
              GlobalContext.nav
                  .pushReplacementNamed(menus.keys.toList()[index]);
            },
            destinations: menus.values
                .map((menu) => NavigationRailDestination(
                      icon: Icon(menu.icone),
                      label: Text(menu.nome),
                    ))
                .toList(),
          );
        });
  }
}
