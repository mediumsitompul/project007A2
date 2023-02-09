import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:convert/convert.dart';
import 'package:project007/success.dart';


main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(appBar: AppBar(title: Center(child: Text('POLLING SYSTEM')),),
      body: MyPolling(),
      ),
    );
  }
}


class MyPolling extends StatefulWidget {
  MyPolling({Key? key}) : super(key: key);

  @override
  State<MyPolling> createState() => _MyPollingState();
}


enum OS{mac, windows, linux, android, ios}

class _MyPollingState extends State<MyPolling> {
  TextEditingController osController = TextEditingController();
  OS? _os;

  Future<void> _select() async{
    var url=Uri.parse('http://192.168.100.100:8087/radio/polling.php');
    var response = await http.post(url, body: {"opsys": _os.toString()});
    var result = jsonDecode(response.body);

    if(result.isNotEmpty){
      print('success.....');
      Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp1()));


    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          SizedBox(height: 50,),
          Image(
            height: 100,
            width: 100,
            image: AssetImage("assets/images/medium.jpg")),
          SizedBox(height: 50,),

          Text('Which operating system do you like?'),

          ListTile(
            title: Text('MAC'),
            leading: Radio(value: OS.mac, groupValue: _os, onChanged: (OS? value){
              setState(() {
                controller: osController;
                _os = value;
              });
            }),
          ),


          ListTile(
            title: Text('WINDOWS'),
            leading: Radio(value: OS.windows, groupValue: _os, onChanged: (OS? value){
              setState(() {
                controller: osController;
                _os = value;
              });
            }),
          ),


          ListTile(
            title: Text('LINUX'),
            leading: Radio(value: OS.linux, groupValue: _os, onChanged: (OS? value){
              setState(() {
                controller: osController;
                _os = value;
              });
            }),
          ),


          ListTile(
            title: Text('ANDROID'),
            leading: Radio(value: OS.android, groupValue: _os, onChanged: (OS? value){
              setState(() {
                controller: osController;
                _os = value;
              });
            }),
          ),


          ListTile(
            title: Text('IOS'),
            leading: Radio(value: OS.ios, groupValue: _os, onChanged: (OS? value){
              setState(() {
                controller: osController.toString();//new
                _os = value;
              });
            }),
          ),


          ElevatedButton(onPressed: (){
              _select();
            }, child: Text('E N T E R'))


        ],
      ),
    );
  }
}
