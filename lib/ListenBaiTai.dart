import 'package:flutter/material.dart';

class ListenBaiTai extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text("听百态"),),
        body: ConstrainedBox(
            constraints: BoxConstraints.expand(),
            child: Image.asset(
              'assets/images/ListenBaitai.png',
              fit: BoxFit.fill,
            )
        ),
      ),
    );
  }
}