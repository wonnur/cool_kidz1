import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/user/geticdata.dart';

class IcAuth extends StatefulWidget {

  @override
  State<IcAuth> createState() => _IcAuthState();
}

class _IcAuthState extends State<IcAuth> {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  final String userId = FirebaseAuth.instance.currentUser!.uid;
  final textIcController = TextEditingController();

  String ICntext = '';
  _opengetdata(){
    ICntext = textIcController.text;
    print('$ICntext');
    Navigator.push(context, MaterialPageRoute(builder: (context) => GetData1(ICntext: ICntext,)));}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PLEASE ENTER YOUR IC NUMBER'),
      ),
      body: Column(
        children: [


          SizedBox(height: 20,),
          TextFormField(
            autofocus: false,
            obscureText: false,
            decoration: InputDecoration(
              labelText: ' No IC : ',
              labelStyle: TextStyle(fontSize:  20.0),
              border: OutlineInputBorder(),
              errorStyle:
              TextStyle(color: Colors.black26,
                  fontSize: 15),
            ),
            controller: textIcController,
            validator: (value){
              if( value == null || value.isEmpty){
                return 'Please enter IC number';
              }
              return null;
            },),



          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              ElevatedButton(
                  onPressed: _opengetdata, child: Text('AUTHORIZE THIS DEVICE')),

            ],
          ),

        ],
      ),
    );
  }
}


