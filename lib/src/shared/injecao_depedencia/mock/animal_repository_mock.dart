import 'package:link_animal/src/entity/animal/animal_model.dart';
import 'package:link_animal/src/entity/animal/animal_repository.dart';
import 'package:link_animal/src/shared/injecao_depedencia/mock/mock_data.dart';

class AnimalRepositoryMock implements AnimalRepository {
  final List<AnimalModel> _animals = mockAnimais;

  @override
  Future<void> createAnimal(AnimalModel animal) async {
    _animals.add(animal);
  }

  @override
  Future<List<AnimalModel>> getAllAnimals() async {
    return _animals;
  }

  @override
  Future<AnimalModel?> getAnimalById(int idAnimal) async {
    try {
      return _animals.firstWhere(
        (animal) => animal.idAnimal == idAnimal,
      );
    } catch (_) {
      return null;
    }
  }

  @override
  Future<void> updateAnimal(AnimalModel animal) async {
    final index = _animals.indexWhere((a) => a.idAnimal == animal.idAnimal);
    if (index != -1) {
      _animals[index] = animal;
    }
  }

  @override
  Future<void> deleteAnimal(int idAnimal) async {
    _animals.removeWhere((animal) => animal.idAnimal == idAnimal);
  }
}
