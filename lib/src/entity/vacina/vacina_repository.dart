import 'package:link_animal/src/entity/vacina/vacina_model.dart';

/// Interface para o repositório de `Vacina`.
abstract class VacinaRepository {
  /// Adiciona uma nova vacina ao banco de dados.
  Future<void> createVacina(VacinaModel vacina);

  /// Retorna uma lista com todas as vacinas.
  Future<List<VacinaModel>> getAllVacinas();

  /// Retorna uma vacina pelo seu ID.
  Future<VacinaModel?> getVacinaById(int idVacina);

  /// Atualiza os dados de uma vacina existente.
  Future<void> updateVacina(VacinaModel vacina);

  /// Remove uma vacina do banco de dados pelo seu ID.
  Future<void> deleteVacina(int idVacina);
}
