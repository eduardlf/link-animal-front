import 'dart:convert';

/// Classe que representa o modelo da tabela `vacina`.
class VacinaModel {
  /// Identificador único da vacina.
  final int idVacina;

  /// Nome da vacina (obrigatório).
  final String nome;

  VacinaModel({
    required this.idVacina,
    required this.nome,
  });

  VacinaModel copyWith({
    int? idVacina,
    String? nome,
  }) {
    return VacinaModel(
      idVacina: idVacina ?? this.idVacina,
      nome: nome ?? this.nome,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idVacina': idVacina,
      'nome': nome,
    };
  }

  factory VacinaModel.fromMap(Map<String, dynamic> map) {
    return VacinaModel(
      idVacina: map['idVacina'] as int,
      nome: map['nome'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory VacinaModel.fromJson(String source) =>
      VacinaModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'VacinaModel(idVacina: $idVacina, nome: $nome)';

  @override
  bool operator ==(covariant VacinaModel other) {
    if (identical(this, other)) return true;

    return other.idVacina == idVacina && other.nome == nome;
  }

  @override
  int get hashCode => idVacina.hashCode ^ nome.hashCode;
}
