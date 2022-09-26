import 'package:flutter_modular/flutter_modular.dart';

import 'find_page.dart';

class FindModule extends Module {
  static const String routeName = 'FindModule';
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (context, args) => FindPage()),
  ];
}
