import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UpdateUserStatus extends StatefulWidget {
  const UpdateUserStatus({Key? key}) : super(key: key);


  @override
  _UpdateUserStatusState createState() => _UpdateUserStatusState();
}

class _UpdateUserStatusState extends State<UpdateUserStatus> {


  String dropdownValue = 'none';
  String dropdownvalue1 = '0';

  CollectionReference users = FirebaseFirestore.instance.collection('users');



  var data1 = '';
  var data2 = 'distance';
  var data3 = '';
  var data4 = '';

  final textdata3Controller = TextEditingController();




  Future<void> getDocs() {
    data3 = textdata3Controller.text;
    print(data1);
    print(data2);
    print(data3);


    return users
        .doc('$data3')
        .update({
      'status' : data1,
    's_distance' : data4,})
        .then((value) => print ("User update"))
        .catchError((error) => print("Failed to update user status : $error"));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UPDATE USER STATUS'),
      ),
      body: Form(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 25.0),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text('QUARANTINE STATUS: ',)],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton(

                    value: dropdownValue,
                    style: const TextStyle(color: Colors.blue,fontSize: 20),
                    onChanged: (String? newValue){
                      setState(() {
                        dropdownValue = newValue!;
                        data1 = dropdownValue;


                      });
                    },
                    items: <String>['none','quarantine','not quarantine']
                        .map<DropdownMenuItem<String>>((String value){
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),

                  )],
              ),
              SizedBox(height: 50.0,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text('SOCIAL DISTANCE: ',)],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton(

                    value: dropdownvalue1,
                    style: const TextStyle(color: Colors.blue,fontSize: 20),
                    onChanged: (String? newValue){
                      setState(() {
                        dropdownvalue1 = newValue!;
                        data4 = dropdownvalue1;


                      });
                    },
                    items: <String>['0','0.5','1','1.5','2','3']
                        .map<DropdownMenuItem<String>>((String value){
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),

                  )],
              ),
              SizedBox(height: 50.0,),



              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: ' USER\'S IC NUMBER : ',
                    hintText: 'ENTER NO IC',
                    labelStyle: TextStyle(fontSize:  20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                    TextStyle(color: Colors.black26,
                        fontSize: 15),
                  ),
                  controller: textdata3Controller,
                  validator: (value){
                    if( value == null || value.isEmpty){
                      return 'Please enter a value';
                    }
                    return null;
                  },),
              ),





              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: getDocs, child: Text('UPDATE USER STATUS')),
                  SizedBox(width: 10,),

                ],
              ),





            ],
          ),
        ),


      ),

    );
  }
}
