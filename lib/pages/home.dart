// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable

import 'package:flutter/material.dart';

import '../models/nota.dart';
import '../values/tema.dart';

class HomePage extends StatelessWidget {
  List<Nota> misNotas = [
    Nota(titulo: 'Titulo 1', contenido: 'Contenido de la nota 1'),
    Nota(titulo: 'Titulo 2', contenido: 'Contenido de la nota 2'),
    Nota(titulo: 'Titulo 3', contenido: 'Contenido de la nota 3'),
    Nota(titulo: 'Titulo 4', contenido: 'Contenido de la nota 4'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Bloc de notas"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return const ModalNota();
              },
            );
          },
          child: const Icon(Icons.add),
        ),
        body: ListView(
          children: [
            for (var nota in misNotas)
              ListTile(
                title: Text(nota.titulo!),
                subtitle: Text(nota.contenido!),
              )
          ],
        ));
  }
}

class ModalNota extends StatefulWidget {
  const ModalNota({Key? key}) : super(key: key);

  @override
  State<ModalNota> createState() => _ModalNotaState();
}

class _ModalNotaState extends State<ModalNota> {
  final TextEditingController _tituloControler = TextEditingController();
  final GlobalKey _key = GlobalKey<FormState>();
  final TextEditingController _contenidoControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      //height: 300,
      color: crema,
      child: Form(
          key: _key,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: _tituloControler,
                  decoration:
                      const InputDecoration(labelText: 'titulo de la nota:'),
                ),
                TextFormField(
                  controller: _contenidoControler,
                  decoration: const InputDecoration(labelText: 'contenido:'),
                  maxLines: 10,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                        onPressed: () async {
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Nota agregada")));
                        },
                        child: const Text("Aceptar")),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Cancelar"))
                  ],
                )
              ],
            ),
          )),
    );
  }

  @override
  void dispose() {
    _contenidoControler.dispose();
    _tituloControler.dispose();
    super.dispose();
  }
}
