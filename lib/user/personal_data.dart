import 'package:flutter/material.dart';

import 'getdata.dart';
import 'location_user.dart';

class PersonalData extends StatefulWidget {

  final String?  ICntext;
  PersonalData({this.ICntext});

  @override
  State<PersonalData> createState() => _PersonalDataState();
}

class _PersonalDataState extends State<PersonalData> {


  String? ICntext;
  void initState() {
    // TODO: implement initState
    super.initState();
    ICntext = widget.ICntext;
  }


  _opengetdata(){
    print('$ICntext');
    Navigator.push(context, MaterialPageRoute(builder: (context) => GetData(ICntext: ICntext,)));}


  _openuserlocation(){
    print('$ICntext');
    Navigator.push(context, MaterialPageRoute(builder: (context) => LocationUser(ICntext: ICntext,)));}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("USER DATA"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [ElevatedButton(
              onPressed:_opengetdata,
              child: const Text('PERSONAL DATA'),
              style: ElevatedButton.styleFrom(fixedSize: const Size(300, 100),primary: Colors.blue),
            ),],
          ),
          Row(children: [Text('')],),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [ElevatedButton(
              onPressed:_openuserlocation,
              child: const Text('USER LOCATION'),
              style: ElevatedButton.styleFrom(fixedSize: const Size(300, 100),primary: Colors.blue),
            ),],
          ),
          Row(children: [Text('')],),

        ],

      ),

    );
  }
}


