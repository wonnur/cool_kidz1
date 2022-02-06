// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
// class getIcNum extends StatefulWidget {
//   const getIcNum({Key? key}) : super(key: key);
//
//   @override
//   State<getIcNum> createState() => _getIcNumState();
// }
//
// class _getIcNumState extends State<getIcNum> {
//   @override
//   Widget build(BuildContext context) {
//
//     var ICn = '';
//
//     final String documentId;
//
//     getIcNum(this.documentId);
//
//     @override
//     Widget build(BuildContext context) {
//       CollectionReference users = FirebaseFirestore.instance.collection('users');
//
//       return FutureBuilder<DocumentSnapshot>(
//         future: users.doc(documentId).get(),
//         builder:
//             (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
//
//           if (snapshot.hasError) {
//             return Text("Something went wrong");
//           }
//
//           if (snapshot.hasData && !snapshot.data!.exists) {
//             return Text("Document does not exist");
//           }
//
//           if (snapshot.connectionState == ConnectionState.done) {
//             Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
//             ICn =
//             if(documentId == Icn)
//             return Text(documentId);
//           }
//
//           return Text("loading");
//         },
//       );
//     }  }
// }
//
