import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/pages/login.dart';
import 'login.dart';


class Signup extends StatefulWidget {

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  final _formKey = GlobalKey<FormState>();

  var textName ='';
  var textIc ='';
  var email = '';
  var password =  '';
  var confirmPassword = '';

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final textNameController = TextEditingController();
  final textIcController = TextEditingController();

  Future<void> addUser(){


    textName =textNameController.text;
    textIc =textIcController.text;

    return users.doc(textIc).set({
      'Name': textName,
      'IC number' : textIc,


    }).then((value) => print("user added"))
        .catchError((error) => print("Failed to add user"));

  }
  registration() async{
    if(password == confirmPassword){
      try{
          UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
          print (userCredential);

          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.blueGrey,
            content: Text('Registered Successfully , Please Sign In',
            style: TextStyle(fontSize: 20.0),
            ),
          ),
          );
          addUser();
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder) => LoginPage(),),);

      } on FirebaseAuthException catch(error){
        if(error.code=='weak-password'){
          print (' Password is too weak ');

          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.black26,
            content: Text('Password is too weak',
              style: TextStyle(fontSize: 20.0, color: Colors.amberAccent),
            ),
          ),
          );

        }
        else if(error.code == 'email-already-in-use'){
          print ('Account is already exist ');
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.black26,
            content: Text('Account is already exist',
              style: TextStyle(fontSize: 20.0, color: Colors.amberAccent),
            ),
          ),
          );
}



    }

    }
    else{
      print ('Password and Confirm Password does not match');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.black26,
        content: Text('Password and Confirm Password does not match',
          style: TextStyle(fontSize: 20.0, color: Colors.amberAccent),
        ),
      ),
      );
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 60.0, horizontal: 20.0),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                //child: Image.asset("images/signup.png"),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'EMAIL: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                      TextStyle(color: Colors.black26, fontSize: 15.0),


                  ),
                controller: emailController,
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Please enter email';
                    }
                    else if (!value.contains('@')){
                      return 'Please enter a valid email';

                    }
                    return null;
                  },
                ),

              ),

              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                 child: TextFormField(
                  autofocus: false,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: ' PASSWORD: ',
                    labelStyle: TextStyle(fontSize:  20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                      TextStyle(color: Colors.black26,
                      fontSize: 15),
                  ),
                  controller: passwordController,
                  validator: (value){
                    if( value == null || value.isEmpty){
                      return 'Please enter Password';
                    }
                    return null;

                  },
                ),

              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: ' CONFIRM PASSWORD: ',
                    labelStyle: TextStyle(fontSize:  20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                    TextStyle(color: Colors.black26,
                        fontSize: 15),
                  ),
                  controller: confirmPasswordController,
                  validator: (value){
                    if( value == null || value.isEmpty){
                      return 'Please enter Confirm Password';
                    }
                    return null;

                  },
                ),


              ),

              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'FULL NAME: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                    TextStyle(color: Colors.black26, fontSize: 15.0),


                  ),
                  controller: textNameController,
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Please enter Name';
                    }

                    return null;
                  },
                ),

              ),

              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'NUMBER IC: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                    TextStyle(color: Colors.black26, fontSize: 15.0),


                  ),
                  controller: textIcController,
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Please enter Age';
                    }
                    return null;
                  },
                ),

              ),



              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: (){
                      if(_formKey.currentState!.validate()){
                        setState(() {
                          email = emailController.text;
                          password = passwordController.text;
                          confirmPassword = confirmPasswordController.text;

                        });
                        registration();
                      }
                      },
                        child: Text('SignUP',
                          style: TextStyle(fontSize: 18.0),),
                    )
                  ],
                ),

              ),
            SizedBox(height: 15,),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('already have account ? '),
                    TextButton(onPressed: (){
                      Navigator.pushReplacement(context, PageRouteBuilder(pageBuilder: (context, animation1, animation2) => LoginPage(),
                      transitionDuration: Duration(seconds: 0),),);

                    },
                      child: Text('login'),),
                  ],
                  
                ),
                
                
              ),
            ],

          ),

        ),


      ),

    );
  }
}


