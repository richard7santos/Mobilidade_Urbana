import 'package:flutter/material.dart';

import '../../components/CustomInput.widget.dart';

class RegisterDriver extends StatefulWidget {
  const RegisterDriver({Key? key}) : super(key: key);

  @override
  State<RegisterDriver> createState() => _RegisterDriverState();
}

class _RegisterDriverState extends State<RegisterDriver> {

  TextEditingController _ctrlEndereco = TextEditingController();
  TextEditingController _ctrlNroCnh = TextEditingController();
  TextEditingController _ctrlCatCnh = TextEditingController();
  TextEditingController _ctrlDtNasc = TextEditingController();
  TextEditingController _ctrlNaturalidade = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("Cadastrar Motorista"),
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/fundo.png"), fit: BoxFit.cover)),
          padding: EdgeInsets.all(20),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Input(obscureText: false, hint: "Numero de CNH", ctlr: _ctrlNroCnh, type: TextInputType.emailAddress, icon: Icons.email),
                  Input(obscureText: false, hint: "Categoria", ctlr: _ctrlNroCnh, type: TextInputType.emailAddress, icon: Icons.email),

                ],
              ),
            ),
          ),
        ));
  }
}
