import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../core/const/api_constants.dart';
import '../../core/utils/app_bar_widget.dart';
import '../../core/utils/drawer_widget.dart';
import '../../core/utils/filter_custom.dart';
import 'pages/lost_details_page.dart';
import 'lost_store.dart';

class LostPage extends StatefulWidget {
  const LostPage({Key? key}) : super(key: key);

  @override
  _LostPageState createState() => _LostPageState();
}

class _LostPageState extends State<LostPage> {
  final LostStore store = LostStore();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  String lost = ApiConstants.lost;
  String dog = ApiConstants.dog;
  String cat = ApiConstants.cat;
  String male = ApiConstants.male;

  @override
  void initState() {
    store.fecth().whenComplete(() => store.fecth());
    super.initState();
  }

  Size get preferredSize => const Size.fromHeight(120);

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    var scaffold = Scaffold(
      key: scaffoldKey,
      drawerEnableOpenDragGesture: true,
      drawer: DrawerWidget(user: user!),
      appBar: PreferredSize(
          preferredSize: preferredSize,
          child: AppBarCustom(scaffoldKey: scaffoldKey)),
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
                Filter(
                  onPressAll: () => store.fecth(),
                  onPressDog: () => store.fetchFilter(dog, lost),
                  onPressCat: () => store.fetchFilter(cat, lost),
                ),
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
                      children: store.listPets!
                          .map((item) => GestureDetector(
                                onTap: () {
                                  store.pet = item;
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
                                    borderRadius: BorderRadius.circular(5),
                                    child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            image: DecorationImage(
                                                image: NetworkImage(item.photo),
                                                fit: BoxFit.cover)),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            item.returned
                                                ? Expanded(
                                                    child: SizedBox(
                                                      height: 130,
                                                      width: 180,
                                                      child: Image.asset(
                                                        "assets/encontrado.png",
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                  )
                                                : const SizedBox(),
                                            Container(
                                              width: 180,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  5.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  5.0)),
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
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: <Widget>[
                                                    item.species == cat
                                                        ? const Text("Gato",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 10,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold))
                                                        : const Text("Cão",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 10,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                    item.gender == male
                                                        ? const Icon(
                                                            Icons.male,
                                                            color: Colors.white,
                                                            size: 14,
                                                          )
                                                        : const Icon(
                                                            Icons.female,
                                                            color: Colors.white,
                                                            size: 14,
                                                          ),
                                                    Expanded(
                                                      child: Text(
                                                        item.species == cat
                                                            ? item.catBreed!
                                                            : item.dogBreed!,
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: const TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
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
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text("Carregando dados..."),
                            SizedBox(height: 10),
                            CircularProgressIndicator(),
                          ],
                        ),
                      ),
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
    return scaffold;
  }
}
