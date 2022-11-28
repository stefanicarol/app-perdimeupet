import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:perdimeupet/pages/my_pets/my_pets_store.dart';

import '../../core/const/api_constants.dart';
import '../../theme/app_theme.dart';
import 'my_pets_details_page.dart';

class MyPetPage extends StatefulWidget {
  const MyPetPage({super.key});

  @override
  State<MyPetPage> createState() => _MyPetPageState();
}

class _MyPetPageState extends State<MyPetPage> {
  final MyPetsStore store = MyPetsStore();
  User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    store.fecth(user!.email!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(237, 252, 252, 252),
        appBar: AppBar(
          title: Text("Meus pets".toUpperCase()),
          centerTitle: true,
          backgroundColor: AppTheme.defaultTheme.primaryColor,
          actions: [
            IconButton(
                onPressed: () => store.fecth(user!.email!),
                icon: const Icon(
                  Icons.refresh,
                  color: Colors.white,
                ))
          ],
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Modular.to.navigate('/homepage'),
          ),
        ),
        body: Observer(builder: (context) {
          if (store.response.isCompleted) {
            return ListView.builder(
                itemCount: store.listPets.length,
                itemBuilder: (BuildContext context, int index) {
                  if (store.listPets.isNotEmpty) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => MyPetsDetailsPage(
                              petModel: store.listPets[index],
                            ),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Material(
                          elevation: 50,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5.0)),
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppTheme.defaultTheme.primaryColor
                                  .withOpacity(0.2),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5.0)),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, bottom: 8.0),
                              child: ListTile(
                                contentPadding: const EdgeInsets.all(0),
                                leading: CircleAvatar(
                                  radius: 40.0,
                                  backgroundImage:
                                      NetworkImage(store.listPets[index].photo),
                                  backgroundColor: Colors.transparent,
                                ),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    store.listPets[index].status == ApiConstants.lost
                                        ? Text(
                                            store.listPets[index].returned
                                                ? "ENCONTRADO"
                                                : "NÃO ENCONTRADO",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color:
                                                    store.listPets[index].returned
                                                        ? AppTheme.defaultTheme
                                                            .primaryColor
                                                        : AppTheme.defaultTheme
                                                            .errorColor))
                                        : Text(
                                            store.listPets[index].returned
                                                ? "DEVOLVIDO AO DONO"
                                                : "NÃO DEVOLVIDO AO DONO",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: store.listPets[index].returned
                                                    ? const Color.fromARGB(255, 150, 150, 7)
                                                    : AppTheme.defaultTheme.errorColor)),
                                    Text(
                                        "${store.listPets[index].species} - ${store.listPets[index].gender}",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w400)),
                                  ],
                                ),
                                subtitle: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      store.listPets[index].species ==
                                              ApiConstants.cat
                                          ? store.listPets[index].catBreed!
                                          : store.listPets[index].dogBreed!,
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                    Text(
                                      "${store.listPets[index].status} em ${store.listPets[index].date}  ",
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return const SizedBox(
                      child: Text("Não possui dados cadastrados"),
                    );
                  }
                });
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
          return const SizedBox(
            child: Text("data"),
          );
        }));
  }
}
