import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_firebase_app/admin/change_user_status.dart';
import 'package:flutter_firebase_app/user/adddata.dart';
import 'package:flutter_firebase_app/user/personal_data.dart';

class Dashdoard extends StatefulWidget {

  final String?  ICntext;
  Dashdoard({this.ICntext});

  @override
  _DashdoardState createState() => _DashdoardState();
}

class _DashdoardState extends State<Dashdoard> {
  @override

  String? ICntext;

  void initState() {
    // TODO: implement initState
    super.initState();
    ICntext = widget.ICntext;
  }


  _openAddData(){
    print('$ICntext');

    Navigator.push(context, MaterialPageRoute(builder: (context) => AddData(ICntext:ICntext)));}

  _openChangeUserStatus(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => ChangeUserStatus()));}

  _openpersonaldata(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => PersonalData(ICntext:ICntext)));}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DASHBOARD'),
      ),
     body: Column(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [


         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [ElevatedButton(
             onPressed:_openAddData,
             child: const Text('ADD DATA'),
             style: ElevatedButton.styleFrom(fixedSize: const Size(300, 100),primary: Colors.blue),
           ),],
         ),
         Row(children: [Text('')],),

         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [ElevatedButton(
             onPressed:_openpersonaldata,
             child: const Text('USER DATA'),
             style: ElevatedButton.styleFrom(fixedSize: const Size(300, 100),primary: Colors.blue),
           ),],
         ),
         Row(children: [Text('')],),

         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [ElevatedButton(
             onPressed:_openChangeUserStatus,
             child: const Text('EDIT ADMIN SETTING'),
             style: ElevatedButton.styleFrom(fixedSize: const Size(300, 100),primary: Colors.blue),
           ),],
         ),

       ],
    ),

    );
  }
}
