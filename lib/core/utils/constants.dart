import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Constants {
  //colors
  static const kPrimaryColor = Color(0xFFFFFFFF);
  static const kGreyColor = Color(0xFFEEEEEE);
  static const kBlackColor = Color(0xFF000000);
  static const kDarkGreyColor = Color(0xFF9E9E9E);
  static const kDarkBlueColor = Color(0xFF6057FF);
  static const kBorderColor = Color(0xFFEFEFEF);

  //text
  static const title = "Login Google";
  static const textIntro = "Bem-vindo ao";
  static const textIntroDesc1 = "pet \n ";
  static const textIntroDesc2 = "";
  static const textSmallSignUp = "A inscrição leva menos 1 minuto!";
  static const textSignIn = "Entrar";
  static const textStart = "Conecta-se";
  static const textSignInTitle = "Texto de entrada";
  static const textSmallSignIn = "Você foi perdido";
  static const textSignInGoogle = "Faça login no Google";
  static const textAcc = "Não tem uma conta? ";
  static const textSignUp = "Assine aqui";
  static const textHome = "Home";

  //navigate
  static const signInNavigate = '/sign-in';
  static const homeNavigate = '/home';

  static const statusBarColor = SystemUiOverlayStyle(
      statusBarColor: Constants.kPrimaryColor,
      statusBarIconBrightness: Brightness.dark);
}
