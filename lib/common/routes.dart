// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:kriptografi/data/argument/encrypt_and_decrypt_argument.dart';
import 'package:kriptografi/module/dashboard/dashboard_screen.dart';
import 'package:kriptografi/module/viginere_chiper/decrypt/decrypt_screen.dart';
import 'package:kriptografi/module/viginere_chiper/encrypt/encrypt_screen.dart';
import 'package:kriptografi/module/viginere_chiper/result_viginere.dart';

Route? onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case EncryptScreen.routename:
      return MaterialPageRoute(builder: (_) => EncryptScreen());
    case ResultViginereChipper.routename:
      final argument = settings.arguments as EncryptAndDecryptArgument;

      return MaterialPageRoute(
          builder: (_) => ResultViginereChipper(argument: argument));

    case DecryptScreen.routename:
      return MaterialPageRoute(builder: (_) => DecryptScreen());

    default:
      return MaterialPageRoute(builder: (_) => DashboardScreen());
  }
}
