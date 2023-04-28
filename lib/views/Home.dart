import 'package:flutter/material.dart';
import 'package:mobilidade_urbana/components/CustomInput.widget.dart';
import 'package:mobilidade_urbana/components/Logo.widget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  _login(){
    print("Botão Salvar Acionado");
  }

  TextEditingController _ctrlEmail = TextEditingController();
  TextEditingController _ctrlSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/fundo.png"), fit: BoxFit.cover)),
        padding: EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children:<Widget> [
                Logo(),
                Input(obscureText: false, hint: "Seu E-mail", ctlr: _ctrlEmail, type: TextInputType.emailAddress, icon: Icons.email,),
                Input(obscureText: true, hint: "Sua Senha", ctlr: _ctrlSenha, type: TextInputType.number, icon: Icons.vpn_key),

                Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 10),
                  child: ElevatedButton(
                    child: Text(
                      "Entrar",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: _login,
                  ),
                ),
                Center(
                  child: GestureDetector(
                    child: Text(
                      "Não tem conta? cadastre-se!",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, "/cadastrar");
                    },
                  ),
                ),

              ],

            ),
          ),
        ),
        ),
      );
  }
}
