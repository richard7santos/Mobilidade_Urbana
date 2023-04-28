import 'package:flutter/material.dart';
import 'package:mobilidade_urbana/views/register/RegisterPhoto.dart';

import '../views/Home.dart';
import '../views/register/RegisterDefault.dart';
import '../views/register/RegisterDriver.dart';

class Routes {
  static Route<dynamic>? Rotas(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => Home());
      case "/cadastrar":
        return MaterialPageRoute(builder: (_) => RegisterDefault());
      case "/cadastrar_motorista":
        return MaterialPageRoute(builder: (_) => RegisterDriver());
      case "/cadastrar_foto":
        return MaterialPageRoute(builder: (_) => RegisterPhoto());
      default:
        _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Endereço não encontrado!"),
        ),
        body: Center(
          child: Text("Nada por aqui!"),
        ),
      );
    });
  }
}
