import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
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
  late File _imagem;

  Future  _recuperarImagem(String origemImagem) async {
    late File imagemSelecionada;
    switch (origemImagem){
      case "camera" :
        imagemSelecionada = await ImagePicker.pickImage(source: ImageSource.camera);
        break;
      case "galeria":
        imagemSelecionada = await ImagePicker.pickImage(source: ImageSource.gallery);
        break;
    }
    setState((){
      _imagem = imagemSelecionada;
    });

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
                    backgroundImage: NetworkImage("https://e7.pngegg.com/pngimages/1008/377/png-clipart-computer-icons-avatar-user-profile-avatar-heroes-black-hair-thumbnail.png")
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
