import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:perdimeupet/theme/app_theme.dart';

import '../../core/utils/app_bar_widget.dart';
import '../../core/utils/filter_custom.dart';
import 'lost_details_page.dart';
import 'lost_store.dart';

class LostPage extends StatefulWidget {
  const LostPage({Key? key}) : super(key: key);

  @override
  _LostPageState createState() => _LostPageState();
}

class _LostPageState extends State<LostPage> {
  final LostStore store = LostStore();
  @override
  void initState() {
    store.fecth().whenComplete(() => store.fecthLost());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 140),
        child: Stack(
          children: <Widget>[
            AppBarWidget(context: context, title: 'Perdidos'),
            Container(height: MediaQuery.of(context).size.height * 0.10),
            Positioned(
              top: 70.0,
              left: 20.0,
              right: 20.0,
              child: SizedBox(
                height: 35,
                child: AppBar(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  backgroundColor: Colors.white,
                  leading: GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.subject,
                      color: AppTheme.defaultTheme.primaryColor,
                    ),
                  ),
                  primary: false,
                  title: TextFormField(
                    onFieldSubmitted: (v) {},
                    //    controller: store.searchText,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white, //
                      hintText: "Pesquisar",
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: Color(0xFFA09D9D),
                      ),
                    ),
                  ),
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.search,
                        color: AppTheme.defaultTheme.primaryColor,
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(
            left: 20.0,
            right: 20,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Filtrar por:",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Filter(
                  onPressAll: () => store.fecthLost(),
                  onPressDog: () => store.fecthLostDog(),
                  onPressCat: () => store.fecthLostCat(),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
                Observer(builder: (context) {
                  if (store.response.isCompleted) {
                    return GridView.count(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      children: store.petList!
                          .map((item) => GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => LostDetailsPage(
                                        petModel: item,
                                      ),
                                    ),
                                  );
                                },
                                child: Card(
                                  color: Colors.transparent,
                                  elevation: 0,
                                  child: PhysicalModel(
                                    color: Colors.transparent,
                                    elevation: 3,
                                    shadowColor: Colors.black38,
                                    borderRadius: BorderRadius.circular(20),
                                    child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            image: DecorationImage(
                                                image: NetworkImage(item.photo),
                                                fit: BoxFit.cover)),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              width: 180,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  20.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  20.0)),
                                                  gradient: LinearGradient(
                                                      begin:
                                                          Alignment.bottomRight,
                                                      colors: [
                                                        Colors.black
                                                            .withOpacity(.4),
                                                        Colors.black
                                                            .withOpacity(.2),
                                                      ])),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 14.0, bottom: 4),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(
                                                      item.gender.gender!,
                                                      style: const TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      item.catBreed!.catBreed!,
                                                      style: const TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        )),
                                  ),
                                ),
                              ))
                          .toList(),
                    );
                  }
                  if (store.response.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return const SizedBox();
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
