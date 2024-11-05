import 'package:flutter/material.dart';



class CadastroCaoScreen extends StatefulWidget {
  @override
  _CadastroCaoScreenState createState() => _CadastroCaoScreenState();
}

class _CadastroCaoScreenState extends State<CadastroCaoScreen> {
  final _formKey = GlobalKey<FormState>();
  String nome = '';
  int idade = 0;
  String sexo = 'Macho';
  bool vacinaRaiva = false;
  bool vacinaV8 = false;
  bool vacinaV10 = false;
  bool castrado = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Cães'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Campo Nome
              TextFormField(
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
                decoration: InputDecoration(labelText: 'Idade (em anos)'),
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
              
              // Vacinas
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text('Vacinas:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
              CheckboxListTile(
                title: Text('Vacina contra raiva'),
                value: vacinaRaiva,
                onChanged: (bool? newValue) {
                  setState(() {
                    vacinaRaiva = newValue!;
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Vacina V8'),
                value: vacinaV8,
                onChanged: (bool? newValue) {
                  setState(() {
                    vacinaV8 = newValue!;
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Vacina V10'),
                value: vacinaV10,
                onChanged: (bool? newValue) {
                  setState(() {
                    vacinaV10 = newValue!;
                  });
                },
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
              
              // Botão de salvar
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Aqui você pode salvar os dados ou fazer qualquer ação necessária
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Cão cadastrado com sucesso!')),
                    );
                  }
                },
                child: Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
