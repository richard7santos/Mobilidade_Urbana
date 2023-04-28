import 'package:flutter/material.dart';
import '';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../components/CustomInput.widget.dart';

class RegisterPhoto extends StatefulWidget {
  const RegisterPhoto({Key? key}) : super(key: key);

  @override
  State<RegisterPhoto> createState() => _RegisterPhotoState();

}

class _RegisterPhotoState extends State<RegisterPhoto> {

  TextEditingController _ctrlCep = TextEditingController();
  TextEditingController _ctrlNumero = TextEditingController();
  bool _motorista = false;
  String _errorMessage = "";

  Future ? _recuperarImagem(String origemImagem){
    switch (origemImagem){
      case "camera" :
        print("camera");

        break;
      case "galeria":
        print("Galeria");
        break;
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Carregar Foto"),
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
                  CircleAvatar(
                    radius: 100,
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage("https://static.vecteezy.com/ti/vetor-gratis/p1/7319933-black-avatar-person-icons-user-profile-icon-vetor.jpg")
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:<Widget> [
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: ElevatedButton(
                          child: Text("Usar Câmera"),
                          onPressed: (){
                            _recuperarImagem("camera");
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: ElevatedButton(
                          child: Text("Galeria"),
                          onPressed: (){
                            _recuperarImagem("galeria");
                          },
                        ),
                      ),

                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16, bottom: 10),
                    child: Row(
                      children: [
                        Text("QUERO SER UM MOTORISTA",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Switch(
                            value: _motorista,
                            onChanged: (bool valor){
                              setState(() {
                                _motorista = valor;
                              });
                            }
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 16, bottom: 10),
                    child:  _motorista == true ? ElevatedButton(
                      child: Text(
                        "Próximo",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          "/cadastrar_motorista",
                        )  ;
                      },
                    ) : ElevatedButton(
                      child: Text(
                        "SALVAR",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          "/",
                        )  ;
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
