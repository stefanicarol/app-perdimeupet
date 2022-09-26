import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:perdimeupet/theme/app_theme.dart';

import '../../core/utils/app_bar_widget.dart';

class LostPage extends StatefulWidget {
  const LostPage({Key? key}) : super(key: key);

  @override
  _LostPageState createState() => _LostPageState();
}

class _LostPageState extends State<LostPage> {
  final List<String> _listItem = [
    'assets/images/two.jpg',
    'assets/images/three.jpg',
    'assets/images/four.jpg',
    'assets/images/five.jpg',
    'assets/images/one.jpg',
    'assets/images/two.jpg',
    'assets/images/three.jpg',
    'assets/images/four.jpg',
    'assets/images/five.jpg',
    'assets/cat.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 50 + 80),
        child: Stack(
          children: <Widget>[
            AppBarWidget(
              context: context,
              title: '',
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.10,
            ),
            Positioned(
              top: 40.0,
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton.icon(
                      icon: const Icon(FontAwesomeIcons.dog,
                          color: Colors.black87),
                      label: const Text(
                        "Auau",
                        style: TextStyle(color: Colors.black87),
                      ),
                      onPressed: () => print("it's pressed"),
                      style: ElevatedButton.styleFrom(
                        side:
                            const BorderSide(width: 1.5, color: Colors.black12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    OutlinedButton.icon(
                      icon: const Icon(FontAwesomeIcons.cat,
                          color: Colors.black87),
                      label: const Text(
                        "Miau",
                        style: TextStyle(color: Colors.black87),
                      ),
                      onPressed: () => print("it's pressed"),
                      style: ElevatedButton.styleFrom(
                        elevation: 2,
                        side:
                            const BorderSide(width: 1.5, color: Colors.black12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    OutlinedButton.icon(
                      icon: const Icon(Icons.pets, color: Colors.black),
                      label: const Text(
                        "Todos",
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () => print("it's pressed"),
                      style: ElevatedButton.styleFrom(
                        primary: AppTheme.defaultTheme.secondaryHeaderColor,
                        side: BorderSide(
                            width: 1.5,
                            color: AppTheme.defaultTheme.secondaryHeaderColor),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Icon(FontAwesomeIcons.filter),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Pets achados",
                  style: TextStyle(
                    color: AppTheme.defaultTheme.secondaryHeaderColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 26,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GridView.count(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: _listItem
                      .map((item) => Card(
                            color: Colors.transparent,
                            elevation: 0,
                            child: PhysicalModel(
                              color: Colors.transparent,
                              elevation: 3,
                              shadowColor: Colors.black38,
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                          image: AssetImage(item),
                                          fit: BoxFit.cover)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        width: 180,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(20.0),
                                                    bottomRight:
                                                        Radius.circular(20.0)),
                                            gradient: LinearGradient(
                                                begin: Alignment.bottomRight,
                                                colors: [
                                                  Colors.black.withOpacity(.4),
                                                  Colors.black.withOpacity(.2),
                                                ])),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 14.0, bottom: 4),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: const <Widget>[
                                              Text(
                                                "Macho",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                "Sem raça definida",
                                                style: TextStyle(
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
                          ))
                      .toList(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
