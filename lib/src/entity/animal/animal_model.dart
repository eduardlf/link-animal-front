import 'dart:convert';

/// Classe que representa o modelo da tabela `animal`.
class AnimalModel {
  /// Identificador único do animal.
  final int idAnimal;

  /// Nome do animal (obrigatório).
  final String nome;

  /// Link para a foto do animal (opcional).
  final String linkFoto;

  /// Observações adicionais sobre o animal (opcional).
  final String? observacao;

  AnimalModel({
    required this.idAnimal,
    required this.nome,
    this.linkFoto = 'no-data.png',
    this.observacao,
  });

  AnimalModel copyWith({
    int? idAnimal,
    String? nome,
    String? linkFoto ,
    String? observacao,
  }) {
    return AnimalModel(
      idAnimal: idAnimal ?? this.idAnimal,
      nome: nome ?? this.nome,
      linkFoto: linkFoto ?? this.linkFoto,
      observacao: observacao ?? this.observacao,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idAnimal': idAnimal,
      'nome': nome,
      'linkFoto': linkFoto,
      'observacao': observacao,
    };
  }

  factory AnimalModel.fromMap(Map<String, dynamic> map) {
    return AnimalModel(
      idAnimal: map['idAnimal'] as int,
      nome: map['nome'] as String,
      linkFoto: map['linkFoto'] as String,
      observacao:
          map['observacao'] != null ? map['observacao'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AnimalModel.fromJson(String source) =>
      AnimalModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AnimalModel(idAnimal: $idAnimal, nome: $nome, linkFoto: $linkFoto, observacao: $observacao)';
  }

  @override
  bool operator ==(covariant AnimalModel other) {
    if (identical(this, other)) return true;

    return other.idAnimal == idAnimal &&
        other.nome == nome &&
        other.linkFoto == linkFoto &&
        other.observacao == observacao;
  }

  @override
  int get hashCode {
    return idAnimal.hashCode ^
        nome.hashCode ^
        linkFoto.hashCode ^
        observacao.hashCode;
  }
}
