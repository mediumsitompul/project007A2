import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

main(){
  runApp(MyApp1());
}


class MyApp1 extends StatelessWidget {
  const MyApp1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(appBar: AppBar(title: const Center(child: Text('SUCCESS')),),),
    );
  }
}
