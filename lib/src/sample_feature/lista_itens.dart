import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class GridScreen extends StatefulWidget {
  @override
  _GridScreenState createState() => _GridScreenState();
}

class _GridScreenState extends State<GridScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> items = List.generate(20, (index) => {
        "nome": "Cão $index",
        "data": DateFormat('dd/MM/yyyy').format(DateTime.now().subtract(Duration(days: index * 5))),
      });
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount = screenWidth ~/ 200; // Definindo colunas com largura de 200px para cada tile

    return Scaffold(
      appBar: AppBar(
        title: Text('Tela com Grid e Pesquisa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
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
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount < 1 ? 1 : crossAxisCount, // Garante pelo menos 1 coluna
                  childAspectRatio: 1, // Proporção quadrada
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  if (searchText.isNotEmpty &&
                      !items[index]["nome"]!.toLowerCase().contains(searchText)) {
                    return SizedBox.shrink(); // Oculta os tiles que não correspondem à pesquisa
                  }
                  return Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.photo, size: 40, color: Colors.grey),
                          SizedBox(height: 10),
                          Text(
                            items[index]["nome"]!,
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 5),
                          Text(
                            items[index]["data"]!,
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
