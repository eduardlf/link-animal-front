import 'package:link_animal/src/entity/animal/animal_repository.dart';
import 'package:link_animal/src/entity/animal_vacina/animal_vacina_repository.dart';
import 'package:link_animal/src/entity/vacina/vacina_repository.dart';
import 'package:link_animal/src/shared/injecao_depedencia/injecao_service.dart';
import 'package:link_animal/src/shared/injecao_depedencia/mock/animal_repository_mock.dart';
import 'package:link_animal/src/shared/injecao_depedencia/mock/animal_vacina_repository_mock.dart';
import 'package:link_animal/src/shared/injecao_depedencia/mock/vacina_repository_mock.dart';

class Injecao {


  static iniciar() {

    // InjecaoService().registerLazySingleton<VacinaRepository>(() => VacinaRepositoryDatabase());
    // InjecaoService().registerLazySingleton<AnimalRepository>(() => VacinaRepositoryDatabase());
    // InjecaoService().registerLazySingleton<AnimalVacinaRepository>(() => VacinaRepositoryDatabase());

    InjecaoService().registerLazySingleton<VacinaRepository>(() => VacinaRepositoryMock());
    InjecaoService().registerLazySingleton<AnimalRepository>(() => AnimalRepositoryMock());
    InjecaoService().registerLazySingleton<AnimalVacinaRepository>(() => AnimalVacinaRepositoryMock());
  }
}
