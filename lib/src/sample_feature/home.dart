import 'package:flutter/material.dart';
import 'package:link_animal/src/sample_feature/cadastro.dart';
import 'package:link_animal/src/sample_feature/dashboard.dart';
import 'package:link_animal/src/sample_feature/menu_lateral/menu_lateral_mob.dart';
import 'package:link_animal/src/sample_feature/menu_lateral/menu_lateral_web.dart';
import 'package:link_animal/src/sample_feature/menu_lateral/menus.dart';
import 'package:link_animal/src/shared/global_context.dart';

class AppRouterHome extends RouterDelegate<RouteSettings>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RouteSettings> {
  static const initialRoute = '/pagina-inicial';

  String currentRoute;

  AppRouterHome() : currentRoute = initialRoute;

  @override
  GlobalKey<NavigatorState>? get navigatorKey => GlobalContext.key;

  @override
  RouteSettings? get currentConfiguration => RouteSettings(name: currentRoute);

  @override
  Future<void> setNewRoutePath(RouteSettings configuration) async {
    currentRoute = configuration.name ?? initialRoute;
    notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return Overlay(
      initialEntries: [
        OverlayEntry(
          builder: (context) => Scaffold(
            // appBar: AppBar(title: const Text('Menu Lateral Mobile')),
            drawer:
                !GlobalContext.isWeb(context) ? const MenuLateralMob() : null,
            body: Row(
              children: [
                GlobalContext.isWeb(context)
                    ? MenuLateralWeb(
                        appRouterHome: this,
                      )
                    : const SizedBox.shrink(),
                Expanded(
                  child: Navigator(
                    key: GlobalContext.key,
                    // initialRoute: initialRoute,
                    onGenerateRoute: (RouteSettings settings) {
                      Widget widget = AnimalDashboard();
                      if (settings.name != null) {
                        if (menus.containsKey(settings.name)) {
                          widget = menus[settings.name!]!.widget;
                        } else {
                          // widget = AnimalDashboard();
                          final regex = RegExp(r'/animal[0-9]+$');
                          if (regex.hasMatch(settings.name!)) {
                            var n = settings.name!.split('animal')[1];
                            var nn = int.tryParse(n);
                            //   // settings.name
                            widget = CadastroCaoScreen(
                              idAnimal: nn,
                            );
                          }
                        }
                      }
                      // if (currentRoute != (settings.name ?? initialRoute)) {
                      //   currentRoute = settings.name ?? initialRoute;
                      //   notifyListeners();
                      // }
                      return MaterialPageRoute(builder: (_) => widget);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
