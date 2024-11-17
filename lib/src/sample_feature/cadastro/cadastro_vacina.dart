import 'package:flutter/material.dart';
import 'package:link_animal/src/entity/vacina/vacina_model.dart';
import 'package:link_animal/src/entity/vacina/vacina_repository.dart';
import 'package:link_animal/src/shared/injecao_depedencia/injecao_facade.dart';

class CadastroVacina extends StatefulWidget {
  const CadastroVacina({super.key});

  @override
  createState() => _CadastroVacina();
}

class _CadastroVacina extends State<CadastroVacina> {
  List<VacinaModel> _vacinas = [];
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _validadeController = TextEditingController();
  final TextEditingController _filtroController = TextEditingController();
  int? _vacinaEditando;

  @override
  Widget build(BuildContext context) {
    final vacinaRepo = getInj<VacinaRepository>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Vacinas'),
      ),
      body: Row(
        children: [
          // Lista de vacinas
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Lista de Vacinas',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(height: 8),
                  Expanded(
                    child: FutureBuilder<List<VacinaModel>>(
                        future: vacinaRepo.getAllVacinas(),
                        builder: (context, snapshot) {
                          _vacinas = snapshot.data!;
                          return ListView.builder(
                            itemCount: _vacinas.length,
                            itemBuilder: (context, index) {
                              final vacina = _vacinas[index];
                              return ListTile(
                                title: Text(vacina.nome),
                                subtitle: Text(
                                    'Validade: ${vacina.idVacina} meses após aplicação'),
                                trailing: IconButton(
                                  icon: Icon(Icons.edit),
                                  onPressed: () {
                                    setState(() {
                                      _vacinaEditando = index;
                                      _nomeController.text = vacina.nome;
                                      _validadeController.text =
                                          vacina.idVacina.toString();
                                    });
                                  },
                                ),
                              );
                            },
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
          // Divisor vertical
          VerticalDivider(width: 1),
          // Filtros e formulário
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  // Filtros
                  Text(
                    'Filtrar Vacinas',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(height: 8),
                  TextField(
                    controller: _filtroController,
                    decoration: InputDecoration(
                      labelText: 'Filtrar por nome',
                      suffixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          setState(() {
                            // Implementar filtro aqui, se necessário
                          });
                        },
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16),
                  // Formulário de cadastro/edição
                  Text(
                    _vacinaEditando == null
                        ? 'Cadastrar Vacina'
                        : 'Editar Vacina',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(height: 8),
                  Card(
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          TextField(
                            controller: _nomeController,
                            decoration: InputDecoration(
                              labelText: 'Nome',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 8),
                          TextField(
                            controller: _validadeController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Validade (meses)',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              if (_vacinaEditando != null)
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      _vacinaEditando = null;
                                      _nomeController.clear();
                                      _validadeController.clear();
                                    });
                                  },
                                  child: Text('Cancelar'),
                                ),
                              ElevatedButton(
                                onPressed: () {
                                  final nome = _nomeController.text.trim();
                                  final validade = int.tryParse(
                                      _validadeController.text.trim());

                                  if (nome.isEmpty || validade == null) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                            'Preencha todos os campos corretamente.'),
                                      ),
                                    );
                                    return;
                                  }

                                  setState(() {
                                    if (_vacinaEditando == null) {
                                      _vacinas.add(VacinaModel(
                                        idVacina: 1,
                                        nome: nome,
                                        // 'validade': validade,
                                      ));
                                    } else {
                                      _vacinas[_vacinaEditando!] = VacinaModel(
                                        idVacina: 1,
                                        nome: nome,
                                        // 'validade': validade,
                                      );
                                      _vacinaEditando = null;
                                    }
                                    _nomeController.clear();
                                    _validadeController.clear();
                                  });
                                },
                                child: Text(
                                  _vacinaEditando == null
                                      ? 'Cadastrar'
                                      : 'Salvar',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
