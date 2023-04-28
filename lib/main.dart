import 'package:flutter/material.dart';
import 'package:mobilidade_urbana/routes/routes.dart';
import 'package:mobilidade_urbana/views/Home.dart';


void main() => runApp(MaterialApp(
  title:"Mobilidade Urbana" ,
  home: Home(),
  initialRoute: "/",
  onGenerateRoute: Routes.Rotas,
  debugShowCheckedModeBanner: false,
));
