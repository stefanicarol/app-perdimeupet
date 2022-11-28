import 'package:flutter_modular/flutter_modular.dart';
import 'package:perdimeupet/core/repository/pet.repository.dart';
import 'package:perdimeupet/pages/find/find_module.dart';
import 'package:perdimeupet/pages/my_pets/my_pets_page.dart';
import 'package:perdimeupet/pages/sign_in_page.dart';
import 'core/repository/character.repository.dart';
import 'core/repository/match.repository.dart';
import 'core/services/api_provider.dart';
import 'pages/home_page.dart';
import 'pages/register_pet/register_module.dart';
import 'pages/register_pet/register_store.dart';
import 'pages/welcome_page.dart';

class AppModule extends Module {
  static const String routeName = '/AppModule';
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => CharacterRepository(Modular.get<ApiProvider>())),
    Bind.lazySingleton((i) => PetRepository(Modular.get<ApiProvider>())),
    Bind.lazySingleton((i) => RegisterStore()),
    Bind.lazySingleton((i) => ApiProvider()),
    Bind.lazySingleton((i) => MatchRepository(Modular.get<ApiProvider>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (context, args) => const SignInPage()),
    ChildRoute('/welcome', child: (context, args) => const WelcomePage()),
    ChildRoute('/homepage', child: (context, args) => const HomePage()),
    ChildRoute('/mypet', child: (context, args) => const MyPetPage()),
    ModuleRoute('/register-module', module: RegisterModule()),
    ModuleRoute('/find-module', module: FindModule()),
  ];
}
