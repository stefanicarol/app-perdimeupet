import 'package:flutter/material.dart';
import 'package:perdimeupet/core/model/pet.model.dart';
import 'package:perdimeupet/theme/app_theme.dart';
import '../../core/utils/bottom_sheet_custom.dart';
import '../../core/utils/leading_appbar_custom.dart';

class LostDetailsPage extends StatefulWidget {
  final PetModel petModel;
  const LostDetailsPage({Key? key, required this.petModel}) : super(key: key);

  @override
  _LostDetailsPageState createState() => _LostDetailsPageState();
}

class _LostDetailsPageState extends State<LostDetailsPage> {
  @override
  Widget build(BuildContext context) {
    String data =
        "${widget.petModel.species.species!} ${widget.petModel.gender.gender!}, da raça ${widget.petModel.catBreed!.catBreed!.toLowerCase()}, cor ${widget.petModel.color.color!}, pelagem ${widget.petModel.pelage.pelage!}, porte ${widget.petModel.size.size!}.";

    return SafeArea(
      child: Scaffold(
        bottomSheet: BottomSheetCustom(
          phoneNumber: widget.petModel.contact!,
        ),
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
                            child: Text("PERDIDO",
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
                                  "perdido em ${widget.petModel.city} na data de ${widget.petModel.date}.",
                                  maxLines: 2))
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
