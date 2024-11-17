import 'package:flutter/material.dart';
import 'package:link_animal/src/sample_feature/agenda/agenda_web.dart';
import 'package:link_animal/src/sample_feature/cadastro.dart';
import 'package:link_animal/src/sample_feature/cadastro/cadastro_vacina.dart';
import 'package:link_animal/src/sample_feature/dashboard.dart';
import 'package:link_animal/src/sample_feature/listagem/lista_animais.dart';

class Menus {
  final String nome;
  final IconData icone;
  final Widget widget;

  Menus({
    required this.nome,
    required this.icone,
    required this.widget,
  });
}

Map<String, Menus> menus = {
  '/pagina-inicial': Menus(
    nome: 'Pagina inicial',
    icone: Icons.home,
    widget: AnimalDashboard(),
  ),
  '/agenda': Menus(
    nome: 'Agenda',
    icone: Icons.calendar_month,
    widget: AgendaWeb(),
  ),
  '/lista-animais': Menus(
    nome: 'Lista de animais',
    icone: Icons.pets,
    widget: ListaAnimais(),
  ),
  '/cadastro_animal': Menus(
    nome: 'Cadastar animal',
    icone: Icons.app_registration,
    widget: CadastroCaoScreen(),
  ),
  '/cadastro_vacina': Menus(
    nome: 'Vacinas',
    icone: Icons.vaccines,
    widget: CadastroVacina(),
  ),
  // MenuLateral(
  //   nome: 'Configurações',
  //   icone: Icons.settings,
  //   rota: '',
  // )
};
