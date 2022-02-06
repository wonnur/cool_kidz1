import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/user/change_pass.dart';
import 'package:flutter_firebase_app/user/dashboard.dart';
import 'package:flutter_firebase_app/user/profile.dart';

class userMain extends StatefulWidget {
  final String?  ICntext;

  userMain({this.ICntext});

  @override
  _userMainState createState() => _userMainState();
}

class _userMainState extends State<userMain> {
  String? ICntext;
  int _seletedIndex =0;

  void initState() {
    // TODO: implement initState
    super.initState();
    ICntext = widget.ICntext;
  }

  _opendashboard(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => Dashdoard(ICntext: ICntext,)));
  }

  _openprofile(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
  }

  _openchangepass(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => ChangePass()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ARB SOCIAL BAND'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [ElevatedButton(
              onPressed:_opendashboard,
              child: const Text('DASBOARD'),
              style: ElevatedButton.styleFrom(fixedSize: const Size(300, 100),primary: Colors.blue),
            ),],
          ),
          Row(children: [Text('')],),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [ElevatedButton(
              onPressed:_openprofile,
              child: const Text('PROFILE'),
              style: ElevatedButton.styleFrom(fixedSize: const Size(300, 100),primary: Colors.blue),
            ),],
          ),
          Row(children: [Text('')],),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [ElevatedButton(
              onPressed:_openchangepass,
              child: const Text('CHANGE PASSWORD'),
              style: ElevatedButton.styleFrom(fixedSize: const Size(300, 100),primary: Colors.blue),
            ),],
          ),
          Row(children: [Text('')],),


        ],
      ),
    );
  }

}


