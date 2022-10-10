import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:perdimeupet/core/model/character.model.dart';
import 'package:perdimeupet/theme/app_theme.dart';
import 'pages/storage_page.dart';
import 'register_store.dart';
import 'widget/radio_list_tile.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final store = Modular.get<RegisterStore>();

  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController observationController = TextEditingController();

  @override
  void initState() {
    store.fecth().whenComplete(() => store.fecthPet());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
          backgroundColor: AppTheme.defaultTheme.primaryColor,
          title: const Text("Cadastre seu pet"),
          centerTitle: true,
          elevation: 0,
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
                            store.species = store.speciesList!.last;
                          },
                        ),
                        CustomRadioListTile(
                          title: 'Gato',
                          groupValue: store.classification!,
                          value: SingingCharacter.gato,
                          onChanged: (value) {
                            store.classification = value;
                            store.species = store.speciesList!.first;
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
                    const Text("Raça gato",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 5),
                    DropdownButtonFormField(
                      items: store.catBreedList!
                          .map<DropdownMenuItem<CatBreed>>((value) {
                        return DropdownMenuItem<CatBreed>(
                          value: value,
                          child: Text(
                            value.catBreed!,
                          ),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        store.catBreed = newValue as CatBreed?;
                      },
                    ),
                    const SizedBox(height: 10),
                    const Text("Cor",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 5),
                    DropdownButtonFormField(
                      items: store.colorList!
                          .map<DropdownMenuItem<ColorPet>>((value) {
                        return DropdownMenuItem<ColorPet>(
                          value: value,
                          child: Text(
                            value.color!,
                          ),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        store.color = newValue as ColorPet?;
                      },
                    ),
                    const SizedBox(height: 10),
                    const Text("Sexo",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 5),
                    DropdownButtonFormField(
                      items: store.genderList!
                          .map<DropdownMenuItem<Gender>>((value) {
                        return DropdownMenuItem<Gender>(
                          value: value,
                          child: Text(
                            value.gender!,
                          ),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        store.gender = newValue as Gender?;
                      },
                    ),
                    const SizedBox(height: 10),
                    const Text("Pelagem",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 5),
                    DropdownButtonFormField(
                      items: store.pelageList!
                          .map<DropdownMenuItem<Pelage>>((value) {
                        return DropdownMenuItem<Pelage>(
                          value: value,
                          child: Text(
                            value.pelage!,
                          ),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        store.pelage = newValue as Pelage?;
                      },
                    ),
                    const SizedBox(height: 10),
                    const Text("Porte",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 5),
                    DropdownButtonFormField(
                      items: store.sizeList!
                          .map<DropdownMenuItem<SizePet>>((value) {
                        return DropdownMenuItem<SizePet>(
                          value: value,
                          child: Text(
                            value.size!,
                          ),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        store.size = newValue as SizePet?;
                      },
                    ),
                    const SizedBox(height: 10),
                    const Text("Número para contato",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 5),
                    TextField(
                      inputFormatters: [
                        MaskTextInputFormatter(mask: "(##) #####-####")
                      ],
                      controller: phoneController,
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text("Cidade/Estado",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 5),
                    TextField(
                      controller: cityController,
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text("Data da ocorrência",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 5),
                    TextField(
                      controller: dateController,
                      inputFormatters: [
                        MaskTextInputFormatter(mask: "##/##/####")
                      ],
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text("Observação",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 5),
                    TextField(
                      controller: observationController,
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text("Inserir foto",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    store.imagem != null
                        ? const SizedBox()
                        : IconButton(
                            onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StoragePage(
                                            store: store,
                                          )),
                                ),
                            icon: const Icon(
                              Icons.add_a_photo,
                              size: 32,
                            )),
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
                    Center(
                      child: ElevatedButton(
                          onPressed: () {
                            store.observation = observationController.text;
                            store.date = dateController.text;
                            store.city = cityController.text;
                            store.numberPhone = phoneController.text;
                            store.post();
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  AppTheme.defaultTheme.secondaryHeaderColor)),
                          child: const Text(
                            "Finalizar cadastro",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          )),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            );
          }
          return const SizedBox();
        }));
  }
}
