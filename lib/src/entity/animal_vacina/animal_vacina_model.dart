import 'dart:convert';

/// Classe que representa o modelo da tabela `animal_vacina`.
class AnimalVacinaModel {
  /// Identificador do animal (chave estrangeira).
  final int idAnimal;

  /// Identificador da vacina (chave estrangeira).
  final int idVacina;

  /// Data da aplicação da vacina (opcional).
  final DateTime? dataAplicacao;

  /// Data agendada para aplicação da vacina (opcional).
  final DateTime? dataAgendada;

  /// Indicador se a vacina foi aplicada.
  final bool vacinado;

  AnimalVacinaModel({
    required this.idAnimal,
    required this.idVacina,
    this.dataAplicacao,
    this.dataAgendada,
    this.vacinado = false,
  });

  AnimalVacinaModel copyWith({
    int? idAnimal,
    int? idVacina,
    DateTime? dataAplicacao,
    DateTime? dataAgendada,
    bool? vacinado,
  }) {
    return AnimalVacinaModel(
      idAnimal: idAnimal ?? this.idAnimal,
      idVacina: idVacina ?? this.idVacina,
      dataAplicacao: dataAplicacao ?? this.dataAplicacao,
      dataAgendada: dataAgendada ?? this.dataAgendada,
      vacinado: vacinado ?? this.vacinado,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idAnimal': idAnimal,
      'idVacina': idVacina,
      'dataAplicacao': dataAplicacao?.millisecondsSinceEpoch,
      'dataAgendada': dataAgendada?.millisecondsSinceEpoch,
      'vacinado': vacinado,
    };
  }

  factory AnimalVacinaModel.fromMap(Map<String, dynamic> map) {
    return AnimalVacinaModel(
      idAnimal: map['idAnimal'] as int,
      idVacina: map['idVacina'] as int,
      dataAplicacao: map['dataAplicacao'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['dataAplicacao'] as int)
          : null,
      dataAgendada: map['dataAgendada'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['dataAgendada'] as int)
          : null,
      vacinado: map['vacinado'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory AnimalVacinaModel.fromJson(String source) =>
      AnimalVacinaModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AnimalVacinaModel(idAnimal: $idAnimal, idVacina: $idVacina, dataAplicacao: $dataAplicacao, dataAgendada: $dataAgendada, vacinado: $vacinado)';
  }

  @override
  bool operator ==(covariant AnimalVacinaModel other) {
    if (identical(this, other)) return true;

    return other.idAnimal == idAnimal &&
        other.idVacina == idVacina &&
        other.dataAplicacao == dataAplicacao &&
        other.dataAgendada == dataAgendada &&
        other.vacinado == vacinado;
  }

  @override
  int get hashCode {
    return idAnimal.hashCode ^
        idVacina.hashCode ^
        dataAplicacao.hashCode ^
        dataAgendada.hashCode ^
        vacinado.hashCode;
  }
}
