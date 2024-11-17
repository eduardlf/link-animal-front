import 'package:link_animal/src/entity/vacina/vacina_model.dart';
import 'package:link_animal/src/entity/vacina/vacina_repository.dart';
import 'package:link_animal/src/shared/injecao_depedencia/mock/mock_data.dart';

class VacinaRepositoryMock implements VacinaRepository {
  final List<VacinaModel> _vacinas = mockVacinas;

  @override
  Future<void> createVacina(VacinaModel vacina) async {
    _vacinas.add(vacina);
  }

  @override
  Future<List<VacinaModel>> getAllVacinas() async {
    return _vacinas;
  }

  @override
  Future<VacinaModel?> getVacinaById(int idVacina) async {
    try {
      return _vacinas.firstWhere(
        (vacina) => vacina.idVacina == idVacina,
      );
    } catch (_) {
      return null;
    }
  }

  @override
  Future<void> updateVacina(VacinaModel vacina) async {
    final index = _vacinas.indexWhere((v) => v.idVacina == vacina.idVacina);
    if (index != -1) {
      _vacinas[index] = vacina;
    }
  }

  @override
  Future<void> deleteVacina(int idVacina) async {
    _vacinas.removeWhere((vacina) => vacina.idVacina == idVacina);
  }
}
