import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../core/utils/custom_dropdown.dart';

import 'pages/storage_page.dart';
import 'register_store.dart';
import 'widget/radio_list_tile.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  final store = Modular.get<RegisterStore>();

  @override
  void initState() {
    store.fecth().whenComplete(() => store.fecthPet());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Cadastre seu pet"),
          centerTitle: true,
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => StoragePage(
                      store: store,
                    )),
          ),
          child: const Icon(Icons.add_a_photo),
        ),
        body: Observer(builder: (context) {
          if (store.fecthResponse.isLoading) {
            return const Padding(
              padding: EdgeInsets.all(18.0),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (store.fecthResponse.hasError) {
            return const Padding(
              padding: EdgeInsets.all(18.0),
              child: Center(
                child: Text(
                  'Tente novamente',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            );
          } else if (store.fecthResponse.isCompleted) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(22.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Preencha corretamente o formulário de cadastro",
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                    const Text("Espécie:"),
                    Row(
                      children: [
                        CustomRadioListTile(
                          title: 'Cachorro',
                          groupValue: store.classification!,
                          value: SingingCharacter.cachorro,
                          onChanged: (value) {
                            store.classification = SingingCharacter.cachorro;
                            store.species = SingingCharacter.cachorro.id;
                          },
                        ),
                        CustomRadioListTile(
                          title: 'Gato',
                          groupValue: store.classification!,
                          value: SingingCharacter.gato,
                          onChanged: (value) {
                            store.classification = value;
                            store.species = SingingCharacter.gato.id;
                          },
                        ),
                      ],
                    ),
                    const Divider(),
                    const SizedBox(height: 10),
                    const Text("Status:"),
                    Row(
                      children: [
                        CustomRadioListTile(
                          title: 'Perdido',
                          groupValue: store.status!,
                          value: SingingCharacter.perdido,
                          onChanged: (value) {
                            store.status = value;
                            store.petStatus = SingingCharacter.perdido.id;
                          },
                        ),
                        CustomRadioListTile(
                          title: 'Achado',
                          groupValue: store.status!,
                          value: SingingCharacter.achado,
                          onChanged: (value) {
                            store.status = value;
                            store.petStatus = SingingCharacter.achado.id;
                          },
                        ),
                      ],
                    ),
                    const Divider(),
                    const SizedBox(height: 10),
                    store.petStatus == SingingCharacter.gato.id
                        ? CustomDropDown<int>(
                            labelText: true,
                            labelTitle: "Raça gato",
                            selectedItem: 1,
                            onChanged: (id) =>
                                store.setElements(i: id, index: 0),
                            selectedItemBuilder: (_) => store.characterList
                                .elementAt(0)
                                .elements
                                .map((character) => Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      character.value,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.start,
                                      style:
                                          const TextStyle(color: Colors.black),
                                    )))
                                .toList(),
                            items: store.characterList
                                .elementAt(0)
                                .elements
                                .map((character) {
                              return DropdownMenuItem(
                                  value: character.id,
                                  child: Text(character.value,
                                      style: const TextStyle(
                                          color: Colors.black)));
                            }).toList())
                        : CustomDropDown<int>(
                            labelText: true,
                            labelTitle: "Raça cachorro",
                            selectedItem: 1,
                            onChanged: (id) =>
                                store.setElements(i: id, index: 0),
                            selectedItemBuilder: (_) => store.characterList
                                .elementAt(1)
                                .elements
                                .map((character) => Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      character.value,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.start,
                                      style:
                                          const TextStyle(color: Colors.black),
                                    )))
                                .toList(),
                            items: store.characterList
                                .elementAt(1)
                                .elements
                                .map((character) {
                              return DropdownMenuItem(
                                  value: character.id,
                                  child: Text(character.value,
                                      style: const TextStyle(
                                          color: Colors.black)));
                            }).toList()),
                    const SizedBox(height: 10),
                    CustomDropDown<int>(
                        labelText: true,
                        labelTitle: "Cor",
                        selectedItem: 2,
                        onChanged: (id) => store.setElements(i: id, index: 1),
                        selectedItemBuilder: (_) => store.characterList
                            .elementAt(2)
                            .elements
                            .map((character) => Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  character.value,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(color: Colors.black),
                                )))
                            .toList(),
                        items: store.characterList
                            .elementAt(2)
                            .elements
                            .map((character) {
                          return DropdownMenuItem(
                              value: character.id,
                              child: Text(character.value,
                                  style: const TextStyle(color: Colors.black)));
                        }).toList()),
                    const SizedBox(height: 10),
                    CustomDropDown<int>(
                        labelText: true,
                        labelTitle: "Sexo",
                        selectedItem: 3,
                        onChanged: (id) => store.setElements(i: id, index: 2),
                        selectedItemBuilder: (_) => store.characterList
                            .elementAt(3)
                            .elements
                            .map((character) => Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  character.value,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(color: Colors.black),
                                )))
                            .toList(),
                        items: store.characterList
                            .elementAt(3)
                            .elements
                            .map((character) {
                          return DropdownMenuItem(
                              value: character.id,
                              child: Text(character.value,
                                  style: const TextStyle(color: Colors.black)));
                        }).toList()),
                    const SizedBox(height: 10),
                    CustomDropDown<int>(
                        labelText: true,
                        labelTitle: "Pelagem",
                        selectedItem: 4,
                        onChanged: (id) => store.setElements(i: id, index: 3),
                        selectedItemBuilder: (_) => store.characterList
                            .elementAt(4)
                            .elements
                            .map((character) => Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  character.value,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(color: Colors.black),
                                )))
                            .toList(),
                        items: store.characterList
                            .elementAt(4)
                            .elements
                            .map((character) {
                          return DropdownMenuItem(
                              value: character.id,
                              child: Text(character.value,
                                  style: const TextStyle(color: Colors.black)));
                        }).toList()),
                    const SizedBox(height: 10),
                    CustomDropDown<int>(
                        labelText: true,
                        labelTitle: "Porte",
                        selectedItem: 5,
                        onChanged: (id) => store.setElements(i: id, index: 4),
                        selectedItemBuilder: (_) => store.characterList
                            .elementAt(5)
                            .elements
                            .map((character) => Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  character.value,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(color: Colors.black),
                                )))
                            .toList(),
                        items: store.characterList
                            .elementAt(5)
                            .elements
                            .map((character) {
                          return DropdownMenuItem(
                              value: character.id,
                              child: Text(character.value,
                                  style: const TextStyle(color: Colors.black)));
                        }).toList()),
                    const SizedBox(height: 20),
                    store.imagem != null
                        ? Center(
                            child: SizedBox(
                              height: 200,
                              child: CachedNetworkImage(
                                placeholder: (context, url) =>
                                    const CircularProgressIndicator(),
                                imageUrl: store.imagem!,
                              ),
                            ),
                          )
                        : const SizedBox(),
                    const SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                          onPressed: () {
                            store.post();
                          },
                          child: const Text("Finalizar cadastro")),
                    )
                  ],
                ),
              ),
            );
          }
          return const SizedBox();
        }));
  }
}
