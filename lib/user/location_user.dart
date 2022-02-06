import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LocationUser extends StatefulWidget {
  final String? ICntext;

  LocationUser({this.ICntext});


  @override
  State<LocationUser> createState() => _LocationUserState();
}

class _LocationUserState extends State<LocationUser> {
  
  CollectionReference Location = FirebaseFirestore.instance.collection('Location');
  String? ICntext;

  var locationD = "";
  var bandS = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ICntext = widget.ICntext;
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: Location.doc('$ICntext').get(),

      builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot){
        if(snapshot.hasError){
          print('$ICntext');

          return Text("Something went wrong");
        }
        if(snapshot.hasData && !snapshot.data!.exists){
          locationD = "NO DATA FOUND";
          bandS = "OFFLINE";

          return Scaffold(
            appBar: AppBar(
              title: Text("USER LOCATION"),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Text('Location : '
                      ,style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),),
                  ],),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text('$locationD'
                    ,style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w300),),
                  ],),
                Row(children: [Text('')],),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Text('Band Status : '
                      ,style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),),
                  ],),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text('$bandS'
                    ,style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w300),),
                  ],),
                Row(children: [Text('')],),

              ],
            ),

          );
        }

        if(snapshot.connectionState == ConnectionState.done){
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
          locationD = data['locationD'];
          bandS = data['bandS'];

          return Scaffold(
            appBar: AppBar(
              title: Text("USER LOCATION"),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Text('Location : '
                    ,style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),),
                  ],),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text('$locationD'
                    ,style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w300),),
                  ],),
                Row(children: [Text('')],),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Text('Band Status : '
                      ,style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),),
                  ],),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text('$bandS'
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

