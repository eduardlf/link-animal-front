import 'dart:async';

import 'package:flutter/material.dart';
import 'package:link_animal/src/entity/animal/animal_model.dart';

import 'dart:math';

import 'package:link_animal/src/entity/animal/animal_repository.dart';
import 'package:link_animal/src/shared/global_context.dart';
import 'package:link_animal/src/shared/injecao_depedencia/injecao_facade.dart';

class ListaAnimais extends StatefulWidget {
  @override
  createState() => _ListaAnimaisState();
}

class _ListaAnimaisState extends State<ListaAnimais> {
  final TextEditingController _searchController = TextEditingController();

  // List<Map<String, String>> items = List.generate(
  //     20,
  //     (index) => {
  //           "nome": "Cão $index",
  //           "data": DateFormat('dd/MM/yyyy')
  //               .format(DateTime.now().subtract(Duration(days: index * 5))),
  //         });
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    final animalRepo = getInj<AnimalRepository>();
    double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount = screenWidth ~/
        250; // Definindo colunas com largura de 200px para cada tile
    String filter = 'Castracao'; // Filtro padrão
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de animais'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Filtro com Dropdown
            // Row(
            //   children: [
            //     Text('Filtrar por: '),
            //     SizedBox(width: 10),
            //     DropdownButton<String>(
            //       value: filter,
            //       onChanged: (String? newFilter) {
            //         setState(() {
            //           filter = newFilter!;
            //         });
            //       },
            //       items: <String>['Castracao', 'Desverminacao', 'Parasitas']
            //           .map<DropdownMenuItem<String>>((String value) {
            //         return DropdownMenuItem<String>(
            //           value: value,
            //           child: Text(value == 'Castracao'
            //               ? 'Lista de Castração'
            //               : value == 'Desverminacao'
            //                   ? 'Datas de Desverminação'
            //                   : 'Controle de Parasitas'),
            //         );
            //       }).toList(),
            //     ),
            //   ],
            // ),
            // SizedBox(height: 10),
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Pesquisar',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {
                  searchText = value.toLowerCase();
                });
              },
            ),
            SizedBox(height: 10),
            Expanded(
              child: FutureBuilder<List<AnimalModel>>(
                  future: animalRepo.getAllAnimals(),
                  builder: (context, snapshot) {
                    final items = snapshot.data!;
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount < 1
                            ? 1
                            : crossAxisCount, // Garante pelo menos 1 coluna
                        childAspectRatio: 0.7, // Proporção quadrada
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                      ),
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        if (searchText.isNotEmpty &&
                            !items[index]
                                .nome
                                .toLowerCase()
                                .contains(searchText)) {
                          return SizedBox
                              .shrink(); // Oculta os tiles que não correspondem à pesquisa
                        }
                        return InkWell(
                          onTap: () {
                            GlobalContext.nav
                                .pushNamed('/animal${items[index].idAnimal}');
                          },
                          child: AnimalCard(
                            nome: items[index].nome,
                            castracaoDate: 'sem data',
                            imageUrl: items[index].linkFoto,
                            observacao: items[index].observacao,
                            desverminacaoDate: 'sem data',
                            vacinacaoStatus: 'sem data',
                          ),
                        );
                        // Card(
                        //   elevation: 2,
                        //   child: Padding(
                        //     padding: const EdgeInsets.all(8.0),
                        //     child: Column(
                        //       mainAxisAlignment: MainAxisAlignment.center,
                        //       children: [
                        //         Icon(Icons.photo, size: 40, color: Colors.grey),
                        //         SizedBox(height: 10),
                        //         Text(
                        //           items[index]["nome"]!,
                        //           style: TextStyle(fontWeight: FontWeight.bold),
                        //           textAlign: TextAlign.center,
                        //         ),
                        //         SizedBox(height: 5),
                        //         Text(
                        //           items[index]["data"]!,
                        //           style: TextStyle(color: Colors.grey),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // );
                      },
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class AnimalCard extends StatelessWidget {
  final String imageUrl;
  final String nome;
  final String? observacao;
  final String castracaoDate;
  final String desverminacaoDate;
  final String vacinacaoStatus;

  const AnimalCard({
    required this.imageUrl,
    required this.nome,
    required this.castracaoDate,
    required this.desverminacaoDate,
    required this.vacinacaoStatus,
    this.observacao,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
            child: Column(
              children: [
                // Parte superior com a imagem do animal
                Expanded(
                    child: Container(
                        color: Colors.grey,
                        child: Image(
                            image: AssetImage(
                                'assets/images/placeholder/${imageUrl}')))),
                // Parte inferior com as informações do animal
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 4),
                      Text(
                        '${nome}',
                        style: TextStyle(fontSize: 20, color: Colors.grey[700]),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Castração: $castracaoDate',
                        style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Desverminação: $desverminacaoDate',
                        style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Vacinação: $vacinacaoStatus',
                        style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment(0.8, 1.0),
            heightFactor: 4.5,
            // child: InkWell(
            //   onTap: () {
            //     if (observacao != null)
            //       mostrarAlertaObservacao(context, observacao!);
            //   },
            child:
                // Positioned(
                // right: 20, // Posição personalizada no Stack
                // bottom: 20,
                // child:
                FloatingActionButton(
              onPressed: () {
                if (observacao != null)
                  mostrarAlertaObservacao(context, observacao!);
              },
              backgroundColor: observacao != null ? Colors.green : Colors.blue,
              child: Icon(
                Icons.assignment_add,
                color: Colors.white,
              ),
            ),
          ),
        ],
        // ),
      ),

      // FloatingActionButton na intersecção
    );
  }

  void mostrarAlertaObservacao(BuildContext context, String observacao) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Observação'),
          content: Text(observacao),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o alerta
              },
              child: Text('Fechar'),
            ),
          ],
        );
      },
    );
  }
}
