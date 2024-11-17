import 'package:link_animal/src/entity/animal_vacina/animal_vacina_model.dart';

/// Interface para o repositório de `AnimalVacina`.
abstract class AnimalVacinaRepository {
  /// Adiciona uma relação animal-vacina ao banco de dados.
  Future<void> createAnimalVacina(AnimalVacinaModel animalVacina);

  /// Retorna uma lista de todas as relações animal-vacina.
  Future<List<AnimalVacinaModel>> getAllAnimalVacinas();

  /// Retorna uma relação animal-vacina específica pelo ID do animal e da vacina.
  Future<AnimalVacinaModel?> getAnimalVacinaByIds(int idAnimal, int idVacina);

  /// Atualiza uma relação animal-vacina existente.
  Future<void> updateAnimalVacina(AnimalVacinaModel animalVacina);

  /// Remove uma relação animal-vacina pelo ID do animal e da vacina.
  Future<void> deleteAnimalVacina(int idAnimal, int idVacina);

  /// Retorna uma lista de vacinas aplicadas (ou não) para um animal específico.
  Future<List<AnimalVacinaModel>> getVacinasByAnimal(int idAnimal,
      {bool? vacinado});
}
