import 'package:flutter_modular/flutter_modular.dart';

import 'lost_page.dart';

class LostModule extends Module {
  static const String routeName = 'LostModule';
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (context, args) => const LostPage()),
  ];
}
