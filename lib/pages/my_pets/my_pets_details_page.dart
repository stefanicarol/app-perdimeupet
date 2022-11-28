import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:perdimeupet/pages/my_pets/my_pets_store.dart';
import 'package:perdimeupet/theme/app_theme.dart';
import '../../core/const/api_constants.dart';
import '../../core/model/pet.model.dart';
import 'my_pets_list_match.dart';

class MyPetsDetailsPage extends StatefulWidget {
  PetModel petModel;

  MyPetsDetailsPage({Key? key, required this.petModel}) : super(key: key);

  @override
  MyPetsDetailsPageState createState() => MyPetsDetailsPageState();
}

class MyPetsDetailsPageState extends State<MyPetsDetailsPage> {
  final MyPetsStore store = MyPetsStore();
  bool? status;
  @override
  void initState() {
    status = widget.petModel.returned;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String data =
        "${widget.petModel.species} ${widget.petModel.gender}, pelagem ${widget.petModel.pelage}, porte ${widget.petModel.size}, cor ${widget.petModel.color}.";

    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: <Widget>[
                    Center(
                      child: SizedBox(
                        height: 300,
                        width: MediaQuery.of(context).size.width,
                        child: Image.network(widget.petModel.photo,
                            fit: BoxFit.fill),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () async {
                          await store
                              .fecth(widget.petModel.owner)
                              .whenComplete(() {
                            Modular.to.pop();
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Center(
                            child: Text(widget.petModel.status.toUpperCase(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 22,
                                    color: AppTheme.defaultTheme.errorColor))),
                        Row(children: [
                          Expanded(
                              child: Text(data,
                                  maxLines: 3, textAlign: TextAlign.justify))
                        ]),
                        const SizedBox(height: 5),
                        Row(children: [
                          const Text("Observação:",
                              style: TextStyle(fontWeight: FontWeight.w700)),
                          const SizedBox(width: 10),
                          Expanded(
                              child: Text(widget.petModel.observation!,
                                  maxLines: 2))
                        ]),
                        const SizedBox(height: 5),
                        Row(children: [
                          const Text("Localização: ",
                              style: TextStyle(fontWeight: FontWeight.w700)),
                          const SizedBox(width: 10),
                          Expanded(
                              child: Text(
                                  "${widget.petModel.status} em ${widget.petModel.city} na data ${widget.petModel.date}",
                                  maxLines: 2))
                        ]),
                        const Divider(),
                        Row(children: [
                          widget.petModel.status == ApiConstants.lost
                              ? const Text("Encontrado: ",
                                  style: TextStyle(fontWeight: FontWeight.w700))
                              : const Text("Devolvido: ",
                                  style:
                                      TextStyle(fontWeight: FontWeight.w700)),
                          const SizedBox(width: 10),
                          Switch(
                              activeColor: AppTheme.defaultTheme.primaryColor,
                              value: status!,
                              onChanged: (value) {
                                setState(() {
                                  status = value;
                                });

                                PetModel petModel = PetModel(
                                  returned: value,
                                  sId: widget.petModel.sId,
                                  dogBreed: widget.petModel.dogBreed,
                                  catBreed: widget.petModel.catBreed,
                                  color: widget.petModel.color,
                                  gender: widget.petModel.gender,
                                  owner: widget.petModel.owner,
                                  pelage: widget.petModel.pelage,
                                  size: widget.petModel.size,
                                  species: widget.petModel.species,
                                  status: widget.petModel.status,
                                  photo: widget.petModel.photo,
                                  contact: widget.petModel.contact,
                                  city: widget.petModel.city,
                                  date: widget.petModel.date,
                                );
                                store.update(petModel, widget.petModel.sId!);
                              }),
                          const SizedBox(width: 30),
                          Center(
                            child: ElevatedButton.icon(
                              label: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: Text(
                                  "Matchs",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const MyPetListMatch(),
                                  ),
                                );
                              },
                              icon: const Icon(Icons.favorite,
                                  color: Colors.white),
                            ),
                          )
                        ]),
                      ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
