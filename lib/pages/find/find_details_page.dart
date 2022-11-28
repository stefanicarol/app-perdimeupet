import 'package:flutter/material.dart';
import 'package:perdimeupet/core/model/pet.model.dart';
import 'package:perdimeupet/theme/app_theme.dart';
import '../../core/utils/bottom_sheet_custom.dart';
import '../../core/utils/leading_appbar_custom.dart';

class FindDetailsPage extends StatefulWidget {
  final PetModel petModel;
  const FindDetailsPage({Key? key, required this.petModel}) : super(key: key);

  @override
  _FindDetailsPageState createState() => _FindDetailsPageState();
}

class _FindDetailsPageState extends State<FindDetailsPage> {
  @override
  Widget build(BuildContext context) {
    String raca = widget.petModel.species == "gato"
        ? widget.petModel.catBreed!.toLowerCase()
        : widget.petModel.dogBreed!.toLowerCase();
    String data =
        "${widget.petModel.species} ${widget.petModel.gender}, da raça $raca, cor ${widget.petModel.color}, pelagem ${widget.petModel.pelage}, porte ${widget.petModel.size}.";
    String status =
        widget.petModel.returned ? "DEVOLVIDO AO DONO" : "DONO NÃO ENCONTRADO";
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
                      child: Image.network(widget.petModel.photo),
                    ),
                    const LeadingAppBarCustom(),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Center(
                            child: Text("ACHADO",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 22,
                                    color: AppTheme
                                        .defaultTheme.secondaryHeaderColor))),
                        Center(
                            child: Text(status,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 14,
                                    color: !widget.petModel.returned
                                        ? AppTheme.defaultTheme.errorColor
                                        : AppTheme.defaultTheme.primaryColor))),
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
                                  "encontrado em ${widget.petModel.city} na data de ${widget.petModel.date}.",
                                  maxLines: 2))
                        ]),
                        const Divider(),
                        BottomSheetCustom(
                          phoneNumber: widget.petModel.contact,
                        )
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
