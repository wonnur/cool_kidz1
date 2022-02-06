import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GetData extends StatefulWidget {


  final String? ICntext;

  GetData({this.ICntext});

  @override
  State<GetData> createState() => _GetDataState();
}

class _GetDataState extends State<GetData> {
  final String userId = FirebaseAuth.instance.currentUser!.uid;

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  String? ICntext;
  var Name = "";
  var Age = "";
  var ICn = "";
  var sdistance = "";
  var status_u = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     ICntext = widget.ICntext;
  }



  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
        future: users.doc('$ICntext').get(),

      builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot){
          if(snapshot.hasError){
            print('$ICntext');

            return Text("Something went wrong");
          }
          if(snapshot.hasData && !snapshot.data!.exists){
            return Text("Document does not exist");
          }

          if(snapshot.connectionState == ConnectionState.done){
            Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
            Name = data['Name'];
            Age = data['Age'];
            ICn = data['IC number'];
            sdistance = data['s_distance'];
            status_u = data['status'];

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
                    children: [Text('STATUS'
                      ,style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),),
                    ],),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text('$status_u'
                      ,style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w300),),
                    ],),
                  Row(children: [Text('')],),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text('AGE'
                      ,style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),),
                    ],),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text('$Age'
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
                    children: [Text('DISTANCE LIMIT'
                      ,style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),),
                    ],),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text('$sdistance' +' meter'
                      ,style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w300),),
                    ],),
                  Row(children: [Text('')],),










                ],
              ),



            );
          }
          return Center(child: CircularProgressIndicator(),);
        },
    );
  }


}
