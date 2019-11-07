import 'package:flutter/material.dart';

class Recommend extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text("产品推荐"),),
        body: ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Image.asset(
            'assets/images/zhutingqi.jpg',
            fit: BoxFit.fill,
          )
        ),
      ),
    );
  }
}