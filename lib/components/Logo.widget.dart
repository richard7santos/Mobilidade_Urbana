import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.only(bottom: 32),
      child: Image.asset("images/logo.png",
        width: 200,
        height: 150,),
    );
  }
}
