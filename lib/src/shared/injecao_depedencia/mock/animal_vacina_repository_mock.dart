import 'package:link_animal/src/entity/animal_vacina/animal_vacina_model.dart';
import 'package:link_animal/src/entity/animal_vacina/animal_vacina_repository.dart';
import 'package:link_animal/src/shared/injecao_depedencia/mock/mock_data.dart';

class AnimalVacinaRepositoryMock implements AnimalVacinaRepository {
  final List<AnimalVacinaModel> _animalVacinas = mockAnimalVacinas;

  @override
  Future<void> createAnimalVacina(AnimalVacinaModel animalVacina) async {
    _animalVacinas.add(animalVacina);
  }

  @override
  Future<List<AnimalVacinaModel>> getAllAnimalVacinas() async {
    return _animalVacinas;
  }

  @override
  Future<AnimalVacinaModel?> getAnimalVacinaByIds(
      int idAnimal, int idVacina) async {
    try {
      return _animalVacinas.firstWhere(
        (av) => av.idAnimal == idAnimal && av.idVacina == idVacina,
      );
    } catch (_) {
      return null;
    }
  }

  @override
  Future<void> updateAnimalVacina(AnimalVacinaModel animalVacina) async {
    final index = _animalVacinas.indexWhere(
      (av) =>
          av.idAnimal == animalVacina.idAnimal &&
          av.idVacina == animalVacina.idVacina,
    );
    if (index != -1) {
      _animalVacinas[index] = animalVacina;
    }
  }

  @override
  Future<void> deleteAnimalVacina(int idAnimal, int idVacina) async {
    _animalVacinas.removeWhere(
      (av) => av.idAnimal == idAnimal && av.idVacina == idVacina,
    );
  }

  @override
  Future<List<AnimalVacinaModel>> getVacinasByAnimal(int idAnimal,
      {bool? vacinado}) async {
    return _animalVacinas.where((av) {
      final matchAnimal = av.idAnimal == idAnimal;
      if (vacinado == null) return matchAnimal;
      return matchAnimal && av.vacinado == vacinado;
    }).toList();
  }
}
