import 'package:flutter/material.dart';
import 'package:link_animal/src/entity/animal/animal_model.dart';
import 'package:link_animal/src/entity/animal/animal_repository.dart';
import 'package:link_animal/src/entity/vacina/vacina_model.dart';
import 'package:link_animal/src/entity/vacina/vacina_repository.dart';
import 'package:link_animal/src/shared/injecao_depedencia/injecao_facade.dart';

class CadastroCaoScreen extends StatefulWidget {
  final int? idAnimal;

  CadastroCaoScreen({this.idAnimal, super.key});

  @override
  _CadastroCaoScreenState createState() => _CadastroCaoScreenState();
}

class _CadastroCaoScreenState extends State<CadastroCaoScreen> {
  final _formKey = GlobalKey<FormState>();
  String nome = 'uuu';
  int idade = 0;
  String sexo = 'Macho';
  String imageUrl = 'no-data.png';
  // String imageUrl = 'no-data.png';
  bool vacinaRaiva = false;
  bool vacinaV8 = false;
  bool vacinaV10 = false;
  bool castrado = false;
  AnimalModel? animal;

  Future<List<VacinaModel>> espera({int? idAnimal}) async {
    if (idAnimal != null) {
      final animalRepo = getInj<AnimalRepository>();
      animal = await animalRepo.getAnimalById(idAnimal);
    }

    final vacinaRepo = getInj<VacinaRepository>();
    return await vacinaRepo.getAllVacinas();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<VacinaModel>>(
        future: espera(idAnimal: widget.idAnimal),
        builder: (context, snapshot) {
          var nomeCon = TextEditingController(text: animal?.nome ?? '');
          var obseCon = TextEditingController(text: animal?.observacao ?? '');
          nome = animal?.nome ?? '';
          imageUrl = animal?.linkFoto ?? 'no-data.png';

          final _vacinas = snapshot.data ?? [];
          return Scaffold(
            appBar: AppBar(
              title: Text('Cadastro de Animals'),
            ),
            body: Row(
              children: [
                // Lista de vacinas
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Container(
                                color: Colors.grey,
                                child: Image(
                                    image: AssetImage(
                                        'assets/images/placeholder/${imageUrl}')))),
                      ],
                    ),
                  ),
                ),
                // Divisor vertical
                VerticalDivider(width: 1),
                // Filtros e formulário
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Form(
                        key: _formKey,
                        child: ListView(
                          children: [
                            // Campo Nome
                            TextFormField(
                              controller: nomeCon,
                              decoration: InputDecoration(labelText: 'Nome'),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Por favor, insira o nome';
                                }
                                return null;
                              },
                              onSaved: (value) => nome = value!,
                            ),

                            // Campo Idade
                            TextFormField(
                              decoration:
                                  InputDecoration(labelText: 'Idade (em anos)'),
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Por favor, insira a idade';
                                }
                                if (int.tryParse(value) == null) {
                                  return 'Insira uma idade válida';
                                }
                                return null;
                              },
                              onSaved: (value) => idade = int.parse(value!),
                            ),

                            // Campo Sexo
                            DropdownButtonFormField<String>(
                              value: sexo,
                              decoration: InputDecoration(labelText: 'Sexo'),
                              items: ['Macho', 'Fêmea'].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  sexo = newValue!;
                                });
                              },
                              onSaved: (value) => sexo = value!,
                            ),
// Castrado
                            CheckboxListTile(
                              title: Text('Castrado'),
                              value: castrado,
                              onChanged: (bool? newValue) {
                                setState(() {
                                  castrado = newValue!;
                                });
                              },
                            ),
                            // Vacinas
                            Padding(
                              padding: const EdgeInsets.only(top: 16.0),
                              child: Text('Vacinas:',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: _vacinas.map<Widget>((vacina) {
                                // return Container();
                                return ListTile(
                                  title: Text(vacina.nome),
                                  subtitle: Text(
                                      'Validade: ${vacina.idVacina} meses após aplicação'),
                                  leading: Checkbox(
                                    // title: Text(vacina.nome),
                                    value: false,
                                    onChanged: (bool? newValue) {
                                      //       setState(() {
                                      //         vacinaRaiva = newValue!;
                                      //       });
                                    },
                                  ),
                                );
                              }).toList(),
                            ),
                            // FutureBuilder<List<VacinaModel>>(
                            //     future: vacinaRepo.getAllVacinas(),
                            //     builder: (context, snapshot) {
                            //     final vacina = _vacinas[index];
                            // return ListTile(
                            //   title: Text(vacina.nome),
                            //   subtitle: Text(
                            //       'Validade: ${vacina.idVacina} meses após aplicação'),
                            //   leading: CheckboxListTile(
                            //     title: Text(vacina.nome),
                            //     value: false,
                            //     onChanged: (bool? newValue) {
                            //       setState(() {
                            //         vacinaRaiva = newValue!;
                            //       });
                            //     },
                            //   ),
                            // );
                            // },
                            // ),
                            //
                            // ),
                            SizedBox(height: 20),
                            // Observação
                            TextFormField(
                              controller: obseCon,
                              maxLines: 6, // Define o número de linhas visíveis
                              minLines: 3, // Mínimo de linhas para expandir
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                labelText: 'Observações do animal',
                                hintText: 'Digite aqui...',
                                border:
                                    OutlineInputBorder(), // Caixa ao redor do campo
                              ),
                            ),

                            // Botão de salvar
                            SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  // Aqui você pode salvar os dados ou fazer qualquer ação necessária
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            'Cão cadastrado com sucesso!')),
                                  );
                                }
                              },
                              child: Text('Salvar'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
