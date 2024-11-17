import 'package:link_animal/src/shared/injecao_depedencia/injecao_service.dart';

/// Interface para abstrair a injeção de dependências.
abstract class InjecaoFacade {
  /// Registra uma instância única preguiçosa.
  void registerLazySingleton<T extends Object>(T Function() factoryFunction);

  /// Recupera uma instância registrada do tipo [T].
  T get<T extends Object>();
}

// Método statico para recupera uma instância registrada do tipo [T].
T getInj<T extends Object>() => InjecaoService().get<T>();
