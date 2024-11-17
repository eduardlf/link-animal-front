import 'package:link_animal/src/entity/animal/animal_model.dart';
import 'package:link_animal/src/entity/animal_vacina/animal_vacina_model.dart';
import 'package:link_animal/src/entity/vacina/vacina_model.dart';

final List<VacinaModel> mockVacinas = [
  VacinaModel(idVacina: 1, nome: 'Vacinação Antirrábica'),
  VacinaModel(idVacina: 2, nome: 'Vacinação Polivalente'),
  VacinaModel(idVacina: 3, nome: 'Vacinação Contra Leptospirose'),
  VacinaModel(idVacina: 4, nome: 'Vacinação Contra Parvovirose'),
  VacinaModel(idVacina: 5, nome: 'Vacinação Contra Cinomose'),
];

final List<AnimalModel> mockAnimais = [
  AnimalModel(
    idAnimal: 1,
    nome: 'Rex',
    linkFoto: '00000-266704894.png',
    observacao: null,
  ),
  AnimalModel(
    idAnimal: 2,
    nome: 'Bella',
    linkFoto: '00007-1482622357.png',
    observacao: 'Cachorra vira-lata muito carinhosa.',
  ),
  AnimalModel(
    idAnimal: 3,
    nome: 'Max',
    linkFoto: '00027-253385948.png',
    observacao: null,
  ),
  AnimalModel(
    idAnimal: 4,
    nome: 'Luna',
    linkFoto: '00031-253385952.png',
    observacao: null,
  ),
  AnimalModel(
    idAnimal: 5,
    nome: 'Thor',
    linkFoto: '00063-1066880983.png',
    observacao: 'Cachorro da raça Bull Terrier, energético e curioso.',
  ),
  AnimalModel(
    idAnimal: 6,
    nome: 'Lily',
    linkFoto: '00083-3740635177.png',
    observacao: 'Cachorra da raça Poodle, pequena e muito dócil.',
  ),
  AnimalModel(
    idAnimal: 7,
    nome: 'Bob',
    linkFoto: '00088-3740635182.png',
    observacao: 'Gosta de farejar tudo.',
  ),
  AnimalModel(
    idAnimal: 8,
    nome: 'Mia',
    linkFoto: '00085-3740635179.png',
    observacao: 'Gata, tranquila e adoradora de carinho.',
  ),
  AnimalModel(
    idAnimal: 9,
    nome: 'Simba',
    linkFoto: '00082-3740635176.png',
    observacao: null,
  ),
  AnimalModel(
    idAnimal: 10,
    nome: 'Charlie',
    linkFoto: '00077-1375940617.png',
    observacao: 'Cachorro da raça Cocker Spaniel, amigável e leal.',
  ),
  AnimalModel(
    idAnimal: 11,
    nome: 'Duda',
    linkFoto: '00078-1375940618.png',
    observacao: 'Gata preta, muito reservada e silenciosa.',
  ),
  AnimalModel(
    idAnimal: 12,
    nome: 'Lucky',
    linkFoto: '00061-1066880981.png',
    observacao: null,
  ),
  AnimalModel(
    idAnimal: 13,
    nome: 'Mickey',
    linkFoto: '00059-1066880979.png',
    observacao: 'Cachorro da raça Dachshund, pequeno e curioso.',
  ),
  AnimalModel(
    idAnimal: 14,
    nome: 'Nina',
    linkFoto: '00045-1249843569.png',
    observacao: 'Cachorra da raça Boxer, adora correr e brincar.',
  ),
  AnimalModel(
    idAnimal: 15,
    nome: 'Zeca',
    linkFoto: '00018-1766549437.png',
    observacao: 'Cachorro vira-lata, muito brincalhão e alegre.',
  ),
];

final List<AnimalVacinaModel> mockAnimalVacinas = [
  AnimalVacinaModel(
    idAnimal: 1,
    idVacina: 1,
    dataAplicacao: DateTime(2024, 1, 15),
    dataAgendada: DateTime(2024, 12, 15),
    vacinado: true,
  ),
  AnimalVacinaModel(
    idAnimal: 1,
    idVacina: 2,
    dataAplicacao: DateTime(2024, 1, 15),
    dataAgendada: DateTime(2024, 12, 15),
    vacinado: true,
  ),
  AnimalVacinaModel(
    idAnimal: 1,
    idVacina: 3,
    dataAplicacao: null,
    dataAgendada: DateTime(2024, 12, 20),
    vacinado: false,
  ),
  AnimalVacinaModel(
    idAnimal: 1,
    idVacina: 4,
    dataAplicacao: null,
    dataAgendada: DateTime(2024, 12, 20),
    vacinado: false,
  ),
  AnimalVacinaModel(
    idAnimal: 1,
    idVacina: 5,
    dataAplicacao: null,
    dataAgendada: DateTime(2024, 12, 25),
    vacinado: false,
  ),
  AnimalVacinaModel(
    idAnimal: 2,
    idVacina: 1,
    dataAplicacao: DateTime(2024, 1, 10),
    dataAgendada: DateTime(2024, 12, 10),
    vacinado: true,
  ),
  AnimalVacinaModel(
    idAnimal: 2,
    idVacina: 2,
    dataAplicacao: DateTime(2024, 1, 10),
    dataAgendada: DateTime(2024, 12, 10),
    vacinado: true,
  ),
  AnimalVacinaModel(
    idAnimal: 2,
    idVacina: 3,
    dataAplicacao: null,
    dataAgendada: DateTime(2024, 12, 15),
    vacinado: false,
  ),
  AnimalVacinaModel(
    idAnimal: 2,
    idVacina: 4,
    dataAplicacao: DateTime(2024, 2, 5),
    dataAgendada: DateTime(2024, 12, 15),
    vacinado: true,
  ),
  AnimalVacinaModel(
    idAnimal: 2,
    idVacina: 5,
    dataAplicacao: DateTime(2024, 3, 1),
    dataAgendada: DateTime(2024, 12, 20),
    vacinado: true,
  ),
  AnimalVacinaModel(
    idAnimal: 3,
    idVacina: 1,
    dataAplicacao: DateTime(2024, 1, 20),
    dataAgendada: DateTime(2024, 12, 20),
    vacinado: true,
  ),
  // (Adicione o restante dos dados com o mesmo padrão...)
];
