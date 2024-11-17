import 'package:link_animal/src/entity/animal/animal_model.dart';

/// Interface para o repositório de `Animal`.
abstract class AnimalRepository {
  /// Adiciona um novo animal ao banco de dados.
  Future<void> createAnimal(AnimalModel animal);

  /// Retorna uma lista com todos os animais.
  Future<List<AnimalModel>> getAllAnimals();

  /// Retorna um animal pelo seu ID.
  Future<AnimalModel?> getAnimalById(int idAnimal);

  /// Atualiza os dados de um animal existente.
  Future<void> updateAnimal(AnimalModel animal);

  /// Remove um animal do banco de dados pelo seu ID.
  Future<void> deleteAnimal(int idAnimal);
}
