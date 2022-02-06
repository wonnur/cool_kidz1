import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/admin/update_band_status.dart';
import 'package:flutter_firebase_app/admin/update_user_status.dart';


class ChangeUserStatus extends StatefulWidget {
  const ChangeUserStatus({Key? key}) : super(key: key);

  @override
  _ChangeUserStatusState createState() => _ChangeUserStatusState();
}


class _ChangeUserStatusState extends State<ChangeUserStatus> {


  _openUpdateUserStatus(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateUserStatus()));}

  _openUpdateBandStatus(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateUserBand()));}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('EDIT ADMIN SETTING'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [ElevatedButton(
              onPressed:_openUpdateUserStatus,
              child: const Text('UPDATE USER STATUS'),
              style: ElevatedButton.styleFrom(fixedSize: const Size(300, 100),primary: Colors.blue),
            ),],
          ),
          Row(children: [Text('')],),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [ElevatedButton(
              onPressed:_openUpdateBandStatus,
              child: const Text('UPDATE BAND STATUS'),
              style: ElevatedButton.styleFrom(fixedSize: const Size(300, 100),primary: Colors.blue),
            ),],
          ),


        ],
      ),
    );
  }
}
