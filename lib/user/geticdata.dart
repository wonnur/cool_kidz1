import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/pages/login.dart';
import 'package:flutter_firebase_app/pages/user_main.dart';
import 'package:flutter_firebase_app/user/dashboard.dart';

class GetData1 extends StatefulWidget {


  final String? ICntext;

  GetData1({this.ICntext});

  @override
  State<GetData1> createState() => _GetData1State();
}

class _GetData1State extends State<GetData1> {
  final String userId = FirebaseAuth.instance.currentUser!.uid;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  String? ICntext;
  var Name = "";
  var ICn = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ICntext = widget.ICntext;
  }

  _opendashboard(){

    Navigator.push(context, MaterialPageRoute(builder: (context) => userMain(ICntext: ICntext)));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc('$ICntext').get(),

      builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot){
        if(snapshot.hasError){
          return Text("Something went wrong");
        }
        if(snapshot.hasData && !snapshot.data!.exists){
          return Text("Document does not exist");
        }

        if(snapshot.connectionState == ConnectionState.done){
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
          Name = data['Name'];
          ICn = data['IC number'];

          return Scaffold(
            appBar: AppBar(
              title: Text("Profile"),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text('NAME'
                    ,style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),),
                  ],),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text('$Name'
                    ,style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w300),),
                  ],),
                Row(children: [Text('')],),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text('IC NUMBER'
                    ,style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),),
                  ],),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text('$ICn'
                    ,style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w300),),
                  ],),
                Row(children: [Text('')],),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: _opendashboard,
                      child: Text(
                        'THIS IS MY DATA',
                        style: TextStyle(fontSize: 18.0,),
                      ),
                      style: ElevatedButton.styleFrom(fixedSize: const Size(300, 100), primary: Colors.blueGrey),
                    ),
                  ],
                ),
                Row(children: [Text('')],),


                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: () async {
                      await  FirebaseAuth.instance.signOut();
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginPage(),), (route) => false);
                    },
                      child: Text(
                        'LOG OUT',
                        style: TextStyle(fontSize: 18.0,),
                      ),
                      style: ElevatedButton.styleFrom(fixedSize: const Size(300, 100), primary: Colors.red),
                    ),
                  ],
                ),

              ],
            ),
          );


        }
        return Center(child: CircularProgressIndicator(),);
      },
    );
  }


}
