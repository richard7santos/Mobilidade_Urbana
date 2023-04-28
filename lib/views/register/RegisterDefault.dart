import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mobilidade_urbana/components/CustomInput.widget.dart';

class RegisterDefault extends StatefulWidget {
  const RegisterDefault({Key? key}) : super(key: key);

  @override
  State<RegisterDefault> createState() => _RegisterDefaultState();
}

class _RegisterDefaultState extends State<RegisterDefault> {

  TextEditingController _ctrlEmail = TextEditingController();
  TextEditingController _ctrlNome = TextEditingController();
  TextEditingController _ctlrDtNasc = TextEditingController();
  TextEditingController _ctrlrPhone = TextEditingController();
  TextEditingController _ctrlCep = TextEditingController();
  TextEditingController _ctrlNumero = TextEditingController();
  String _endereco = "";
  String _numero = "";
  String _errorMessage = "";

  _buscarCep() async {
    String cep = _ctrlCep.text;
    String url = "https://viacep.com.br/ws/${cep}/json/";
    http.Response response;

    response = await http.get(Uri.parse(url));
    Map<String, dynamic> retorno = json.decode(response.body);
    String logradouro = retorno["logradouro"];
    String bairro = retorno["bairro"];
    String localidade = retorno["localidade"];
    String uf = retorno["uf"];
    _numero = _ctrlNumero.text;
    setState(() {
      _endereco =
      "${logradouro}, Nº ${_numero} - ${bairro} - ${localidade}/${uf}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cadastrar Usuário"),
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
                  Input(obscureText: false, hint: "Seu E-mail", ctlr: _ctrlEmail, type: TextInputType.emailAddress, icon: Icons.email),
                  Input(obscureText: false, hint: "Seu nome completo", ctlr: _ctrlNome, type: TextInputType.text, icon: Icons.person),
                  Input(obscureText: false, hint: "Data de Nascimento", ctlr: _ctlrDtNasc, type: TextInputType.datetime, icon: Icons.date_range),
                  Input(obscureText: false, hint: "Seu  Telefone", ctlr: _ctrlrPhone, type: TextInputType.number, icon: Icons.phone, maxLength: 11),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: TextField(
                        controller: _ctrlCep,
                        maxLength: 8,
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                            filled: true,
                            contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                            hintText: "CEP",
                            fillColor: Colors.white,
                            prefixIcon: Icon(Icons.maps_ugc),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6))),
                        onChanged: (String value) async {
                          if (value.length == 8) {
                            _buscarCep();
                          }
                        }),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: TextField(
                        controller: _ctrlNumero,
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                            filled: true,
                            contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                            hintText: "Numero",
                            fillColor: Colors.white,
                            prefixIcon: Icon(Icons.numbers),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6))),
                        onChanged: (String value) async{
                          if( value.isNotEmpty){
                            _buscarCep();
                          }
                        }
                    ),
                  ),
                  Input(
                      obscureText: false,
                      hint: "Endereço",
                      ctlr: TextEditingController(text: "${_endereco}"),
                      type: TextInputType.text,
                      icon: Icons.location_city),

                  Padding(
                    padding: EdgeInsets.only(top: 16, bottom: 10),
                    child: ElevatedButton(
                      child: Text(
                        "Próximo",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: (){
                        Navigator.pushNamed(context, "/cadastrar_foto",
                        );
                      },
                    ) ,
                  ),

                ],
              ),
            ),
          ),
        ));
  }
}
