import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UpdateUserBand extends StatefulWidget {
  const UpdateUserBand({Key? key}) : super(key: key);

  @override
  _UpdateUserBandState createState() => _UpdateUserBandState();
}

class _UpdateUserBandState extends State<UpdateUserBand> {
  CollectionReference Location = FirebaseFirestore.instance.collection('Location');

  Future<void> batchDelete(){
    WriteBatch batch = FirebaseFirestore.instance.batch();

    return Location.get().then((querySnapshot){
      querySnapshot.docs.forEach((document) {
        batch.delete(document.reference);
      });
      return batch.commit();
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UPDATE BAND STATUS"),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text("update band status body"),
            ],
          ),

          Row(children: [Text('')],),
          Row(children: [Text('')],),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [ElevatedButton(
              onPressed:batchDelete,
              child: const Text('UPDATE USER BAND STATUS'),
              style: ElevatedButton.styleFrom(fixedSize: const Size(300, 50),primary: Colors.blue),
            ),],
          ),

        ],

      ),

    );
  }
}
