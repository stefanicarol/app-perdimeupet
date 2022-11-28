import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  var swatch = <int, Color>{};

  final r = color.red, g = color.green, b = color.blue;

  for (var i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}

class ColorsApp {
  const ColorsApp();

  static const Color appBarBackground = Color(0xFF3b3e99);
  static const Color backgroundColor = Color(0xFF0A0A1A);
  static const Color backgroundColor2 = Color(0xFFc1cace);
  static const Color buttom = Color(0xFF596d94);
  static const Color card = Color(0xFF0F1028);
  static const Color checkBoxColor = Color(0xffF2F4F4);
  static const Color checklistCard = Color(0xffF2F4F4);
  static const Color errorColor = Color(0xFFFF5757);
  static const Color icon = Color(0xff67C2E2);
  static const Color iconColor = Color(0xff67C2E2);
  static const Color inputText = Color.fromARGB(255, 255, 253, 253);
  static const Color placeHolder = Color(0xFF596d94);
  static const Color selectText = Color(0xffffc107);
  static const Color subTitle = Color(0xffd9d9d9);
  static const Color successColor = Colors.green;
  static const Color text = Color(0xffd9d9d9);
  static const Color title = Color(0xFF04c4fc);
}

class TextStyles {
  const TextStyles();

  static const TextStyle erro =
      TextStyle(color: Colors.red, fontWeight: FontWeight.w600, fontSize: 14.0);

  static const TextStyle inputSenha = TextStyle(
      color: ColorsApp.placeHolder,
      fontWeight: FontWeight.w600,
      fontSize: 12.0);

  static const TextStyle inputText = TextStyle(
      color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 14.0);

  static const TextStyle legendaStyle = TextStyle(
      color: Colors.white, fontWeight: FontWeight.w600, fontSize: 17.0);

  static const TextStyle loadingBold = TextStyle(
      color: ColorsApp.checkBoxColor,
      fontWeight: FontWeight.w700,
      fontSize: 14.5);

  static const TextStyle notaBold = TextStyle(
      color: ColorsApp.inputText, fontWeight: FontWeight.w700, fontSize: 12.0);

  static const TextStyle notaSubTitle = TextStyle(
      color: ColorsApp.text, fontWeight: FontWeight.w600, fontSize: 12.5);

  static TextStyle placaStyle = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14.0);

  static const TextStyle searchBar = TextStyle(
      color: ColorsApp.text, fontWeight: FontWeight.w600, fontSize: 13.0);

  static const TextStyle select = TextStyle(
      color: ColorsApp.buttom, fontWeight: FontWeight.w600, fontSize: 12.0);

  static const TextStyle selectCheckList = TextStyle(
      color: Colors.black, fontWeight: FontWeight.w600, fontSize: 18.0);

  static const TextStyle selectLight = TextStyle(
      color: ColorsApp.checklistCard,
      fontWeight: FontWeight.w600,
      fontSize: 14.0);

  static const TextStyle subTitle = TextStyle(
      color: ColorsApp.subTitle, fontWeight: FontWeight.w300, fontSize: 14.0);

  static const TextStyle text = TextStyle(
      color: ColorsApp.text, fontWeight: FontWeight.w600, fontSize: 12.5);

  static const TextStyle textMenu =
      TextStyle(fontWeight: FontWeight.w600, fontSize: 13.0);

  static const TextStyle title = TextStyle(
    color: ColorsApp.inputText,
    fontSize: 19,
    fontWeight: FontWeight.bold,
  );
}

class ScaleRoute extends PageRouteBuilder {
  ScaleRoute({required this.page})
      : super(
          pageBuilder: (
            context,
            animation,
            secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            context,
            animation,
            secondaryAnimation,
            child,
          ) =>
              ScaleTransition(
            scale: Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.fastOutSlowIn,
              ),
            ),
            child: child,
          ),
        );

  final Widget page;
}

class SlideRightRoute extends PageRouteBuilder {
  SlideRightRoute({required this.page})
      : super(
          pageBuilder: (
            context,
            animation,
            secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            context,
            animation,
            secondaryAnimation,
            child,
          ) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );

  final Widget page;
}

class SlideLeftRoute extends PageRouteBuilder {
  SlideLeftRoute({required this.page, RouteSettings? settings})
      : super(
          pageBuilder: (
            context,
            animation,
            secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            context,
            animation,
            secondaryAnimation,
            child,
          ) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );

  final Widget page;
}

class Dimens {
  const Dimens();

  static const notaHeight = 25.0;
  static const notaWidth = 25.0;
}

class Dialogs {
  static Future<void> showLoadingDialog(
      BuildContext context, GlobalKey key) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return WillPopScope(
              onWillPop: () async => false,
              child: SimpleDialog(
                  key: key,
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                  children: <Widget>[
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Container(
                              height: 80,
                              width: 80,
                              child: Image.asset("assets/gif/logo_white.gif"),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Aguarde, obtendo os dados..",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )
                        ])
                  ]));
        });
  }
}

class DialogsCompleto {
  static Future<void> showLoadingDialog(
      BuildContext context, GlobalKey key) async {
    final dialogContextCompleter = Completer<BuildContext>();
    showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext dialogContext) {
          if (!dialogContextCompleter.isCompleted) {
            dialogContextCompleter.complete(dialogContext);
          }
          return WillPopScope(
              onWillPop: () async => false,
              child: SimpleDialog(
                  key: key,
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                  children: <Widget>[
                    Center(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Container(
                                height: 80,
                                width: 80,
                                child: Image.asset("assets/gif/logo_white.gif"),
                              ),
                            ),
                            const Text(
                              "Aguarde, preparando para enviar os dados..",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )
                          ]),
                    )
                  ]));
        });

    await Future.delayed(const Duration(seconds: 2));
    Navigator.pop(context);
  }
}

String traceRemover(String str) {
  return str.replaceAll("-", "/");
}

class LogOut {
  static Future<bool> _goToLogin(BuildContext context) {
    return Navigator.of(context).pushReplacementNamed('/').then((_) => false);
  }

  static Future<void> showDialogLogout(BuildContext context) async {
    //final controller = Modular.get<HomeInitStore>();

    Widget cancelaButton = TextButton(
      child: const Text("Não"),
      onPressed: () {
        Modular.to.pop();
      },
    );
    Widget continuaButton = TextButton(
      child: const Text("Sim"),
      onPressed: () {
        //  controller.sharedPrefs.clearLogin();
        _goToLogin(context);
      },
    );
    //configura o AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Atenção"),
      content: const Text(
          "Deseja realmente sair do aplicativo? Os dados atuais não serão gravados."),
      actions: [
        cancelaButton,
        continuaButton,
      ],
    );
    //exibe o diálogo
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

String getInitials({required String string, required int limitTo}) {
  var buffer = StringBuffer();
  var split = string.split('.');
  for (var i = 0; i < (limitTo); i++) {
    buffer.write(split[i][0]);
  }

  return buffer.toString();
}

String getLastName({required String string}) {
  var split = string.split(" ");

  return "${split.first} ${split.last}";
}

class NetworkCheck {
  Future<bool> check() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }
}

// ignore: must_be_immutable
class CustomScrollPhysics extends ScrollPhysics {
  CustomScrollPhysics({ScrollPhysics? parent}) : super(parent: parent);

  bool isGoingLeft = false;

  @override
  CustomScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return CustomScrollPhysics(parent: buildParent(ancestor));
  }

  @override
  double applyPhysicsToUserOffset(ScrollMetrics position, double offset) {
    isGoingLeft = offset.sign < 0;
    return offset;
  }

  @override
  double applyBoundaryConditions(ScrollMetrics position, double value) {
    //print("applyBoundaryConditions");
    assert(() {
      if (value == position.pixels) {
        throw FlutterError(
            '$runtimeType.applyBoundaryConditions() was called redundantly.\n'
            'The proposed new position, $value, is exactly equal to the current position of the '
            'given ${position.runtimeType}, ${position.pixels}.\n'
            'The applyBoundaryConditions method should only be called when the value is '
            'going to actually change the pixels, otherwise it is redundant.\n'
            'The physics object in question was:\n'
            '  $this\n'
            'The position object in question was:\n'
            '  $position\n');
      }
      return true;
    }());
    if (value < position.pixels &&
        position.pixels <= position.minScrollExtent) {
      return value - position.pixels;
    }
    if (position.maxScrollExtent <= position.pixels &&
        position.pixels < value) {
      return value - position.pixels;
    }
    if (value < position.minScrollExtent &&
        position.minScrollExtent < position.pixels) {
      return value - position.minScrollExtent;
    }

    if (position.pixels < position.maxScrollExtent &&
        position.maxScrollExtent < value) {
      return value - position.maxScrollExtent;
    }

    if (!isGoingLeft) {
      return value - position.pixels;
    }
    return 0.0;
  }
}

class Paddings {
  static EdgeInsets fromLTR(double value) {
    return EdgeInsets.only(
      left: value,
      top: value,
      right: value,
    );
  }

  static EdgeInsets fromRBL(double value) {
    return EdgeInsets.only(
      right: value,
      bottom: value,
      left: value,
    );
  }
}
