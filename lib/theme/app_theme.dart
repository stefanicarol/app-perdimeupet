import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get defaultTheme {
    return ThemeData(
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: _AppColors.primaryColor),
        useMaterial3: true,
        fontFamily: 'Poppins',
        secondaryHeaderColor: AppColors.secondaryColor,
        primaryColor: AppColors.primaryColor,
        highlightColor: _AppColors.secondaryColor,
        brightness: Brightness.light,
        hoverColor: const Color.fromARGB(255, 22, 22, 22),
        appBarTheme: const AppBarTheme(
            elevation: 0,
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.white),
            actionsIconTheme: IconThemeData(color: Colors.white),
            titleTextStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18)),
        snackBarTheme: snackBarTheme,
        iconTheme: const IconThemeData(color: Color.fromARGB(255, 10, 10, 10)),
        primaryIconTheme:
            const IconThemeData(color: Color.fromARGB(255, 14, 13, 13)),
        textTheme: TextTheme(
          headline1: headline1,
          headline6: headline6,
          bodyText1: bodyText1,
          bodyText2: bodyText2,
          subtitle1: subtitle1,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Colors.transparent,
          hintStyle:
              TextStyle(fontWeight: FontWeight.normal, color: Colors.black45),
          contentPadding:
              EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 10),
          border: OutlineInputBorder(),
          // enabledBorder: OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(5.0),
          //     borderSide: const BorderSide(color: Colors.black45, width: 1)),
          // focusedBorder: OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(5.0),
          //     borderSide:
          //         const BorderSide(color: _AppColors.primaryColor, width: 2)),
          // errorBorder: OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(5.0),
          //     borderSide: const BorderSide(color: Colors.red, width: 1)),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
          foregroundColor:
              MaterialStateProperty.all<Color>(AppColors.primaryColor),
          backgroundColor:
              MaterialStateProperty.all<Color>(AppColors.primaryColor),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        )));
  }

  static TextTheme get defaultTextTheme => defaultTheme.textTheme;
  MaterialColor color = primaryColorShades;
  static ThemeData get bebasNueTheme {
    return ThemeData(
      fontFamily: 'Poppins',
      primaryColor: _AppColors.accentColor,
      textTheme: TextTheme(
        headline1: headline1,
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primarySwatch: primaryColorShades,
    );
  }

  static TextStyle get headline1 => const TextStyle(
        fontSize: 33,
        fontWeight: FontWeight.bold,
        color: Color(0xFF4F4F4F),
      );

  static TextStyle get headline6 => const TextStyle(
        color: _AppColors.secondaryTextColor,
        fontWeight: FontWeight.w600,
        fontSize: 18,
      );

  static TextStyle get bodyText1 => const TextStyle(
      color: _AppColors.primaryTextColor,
      fontSize: 18,
      fontWeight: FontWeight.w400);

  static TextStyle get bodyText2 =>
      const TextStyle(color: _AppColors.secondaryTextColor, fontSize: 14);

  static TextStyle get subtitle1 => const TextStyle(
      color: _AppColors.primaryTextColor,
      fontSize: 16,
      fontWeight: FontWeight.w400);

  static SnackBarThemeData get snackBarTheme => const SnackBarThemeData(
        backgroundColor: _AppColors.secondaryColor,
      );

  static BottomNavigationBarThemeData get bottomNavigationBarTheme =>
      BottomNavigationBarThemeData(
        selectedLabelStyle: const TextStyle(color: _AppColors.primaryColor),
        unselectedLabelStyle: const TextStyle(color: Color(0xffA1A1A1)),
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppTheme.defaultTheme.primaryColor,
        selectedIconTheme:
            IconThemeData(color: AppTheme.defaultTheme.primaryColor),
      );

  static InputDecorationTheme get searchInputDecorationTheme =>
      const InputDecorationTheme(
          fillColor: Color(0xFFC4C4C4),
          filled: true,
          constraints: BoxConstraints(maxHeight: 40),
          contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFC4C4C4), width: 0),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFC4C4C4), width: 0),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFC4C4C4), width: 0),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          hintStyle: TextStyle(fontSize: 14, color: Colors.white));
}

class _AppColors {
  static const Color primaryColor = Colors.white;
  static const Color accentColor = Color(0xffE2E3E4);
  static const Color secondaryColor = Color(0xff4A6572);
  static const Color primaryTextColor = Color.fromARGB(255, 12, 12, 12);
  static const Color secondaryTextColor = Color(0xff374049);
  static const Color primaryButtonColor = Colors.blueGrey;
}

class AppColors {
  static const Color primaryColor = Color(0xff232f34);
  static const Color onPrimary = Color(0xff0CF2B4);
  static const Color accentColor = Color.fromARGB(255, 13, 13, 14);
  static const Color secondaryColor = Color(0xfff9aa33);
  static const Color primaryTextColor = Color(0xff005A87);
  static const Color secondaryTextColor = Color(0xff374049);
  static const Color secondaryButtonColor = Color(0xff00CD7C);
  static const Color primaryButtonColor = Color(0xff053F64);
  static const Color successColor = Colors.green;
  static const Color onSuccessColor = Colors.white;
}

const MaterialColor primaryColorShades = MaterialColor(
  0xFFFFFFFF,
  <int, Color>{
    50: Color(0xFFFFFFFF),
    100: Color(0xFFA4A4BF),
    200: Color(0xFFA4A4BF),
    300: Color(0xFF9191B3),
    400: Color(0xFF7F7FA6),
    500: Color(0xFF181861),
    600: Color(0xFF6D6D99),
    700: Color(0xFF5B5B8D),
    800: Color(0xFF494980),
    900: Color(0xFF181861),
  },
);
