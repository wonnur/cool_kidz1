import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/user/getdata.dart';
import 'package:flutter_firebase_app/user/location_user.dart';

class AddData extends StatefulWidget {
  final String?  ICntext;

  AddData({this.ICntext});

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  String? ICntext;
  void initState() {
    // TODO: implement initState
    super.initState();
    ICntext = widget.ICntext;
  }

  final String userId = FirebaseAuth.instance.currentUser!.uid;

  var textName ='';

  var textIc ='';

  var textAge ='';

  final textNameController = TextEditingController();

  final textIcController = TextEditingController();

  final textAgeController = TextEditingController();


  Future<void> addData1(){


    textName =textNameController.text;
    textIc =textIcController.text;
    textAge =textAgeController.text;

    return users.doc(textIc).set({
    'Name': textName,
    'Age':textAge,
      'IC number' : textIc,
     's_distance':'0',
    'status':'not quarantine',
      'UserID': userId,


    }).then((value) => print("user added"))
    .catchError((error) => print("Failed to add user"));

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
          title: Text('ADD DATA'),
        ),
        body: Column(
          children: [

            SizedBox(height: 20,),
            TextFormField(
              autofocus: false,
              obscureText: false,
              decoration: InputDecoration(
                labelText: ' Name: ',
                labelStyle: TextStyle(fontSize:  20.0),
                border: OutlineInputBorder(),
                errorStyle:
                TextStyle(color: Colors.black26,
                    fontSize: 15),
              ),
              controller: textNameController,
              validator: (value){
                if( value == null || value.isEmpty){
                  return 'Please enter Name';
                }
                return null;
              },),
            SizedBox(height: 20,),
            TextFormField(
              autofocus: false,
              obscureText: false,
              decoration: InputDecoration(
                labelText: ' Age: ',
                labelStyle: TextStyle(fontSize:  20.0),
                border: OutlineInputBorder(),
                errorStyle:
                TextStyle(color: Colors.black26,
                    fontSize: 15),
              ),
              controller: textAgeController,
              validator: (value){
                if( value == null || value.isEmpty){
                  return 'Please enter Age';
                }
                return null;
              },),

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


            Row(children: [Text('')],),
            Row(children: [Text('')],),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [ElevatedButton(
                onPressed:addData1,
                child: const Text('SUBMIT DATA'),
                style: ElevatedButton.styleFrom(fixedSize: const Size(300, 50),primary: Colors.blue),
              ),],
            ),
            Row(children: [Text('')],),




          ],
        ),
    );
  }
}


