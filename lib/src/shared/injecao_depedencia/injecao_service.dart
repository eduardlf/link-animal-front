import 'package:get_it/get_it.dart';
import 'package:link_animal/src/shared/injecao_depedencia/injecao_facade.dart';

/// Implementação do ServiceLocator usando o GetIt.
class InjecaoService implements InjecaoFacade {
  final GetIt _getIt = GetIt.instance;

  @override
  void registerLazySingleton<T extends Object>(T Function() factoryFunction) {
    _getIt.registerLazySingleton(factoryFunction);
  }

  @override
  T get<T extends Object>() {
    return _getIt<T >();
  }
}
