import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/pages/login.dart';

class ChangePass extends StatefulWidget {
  const ChangePass({Key? key}) : super(key: key);

  @override
  _ChangePassState createState() => _ChangePassState();
}

class _ChangePassState extends State<ChangePass> {

  final _formKey = GlobalKey<FormState>();

  var newPassword = "";

  final newPasswordController = TextEditingController();

  @override
  void dispose() {
    newPasswordController.dispose();
    super.dispose();
  }

  final currentUser = FirebaseAuth.instance.currentUser;

  changePassword() async{
    try{
      await currentUser!.updatePassword(newPassword);
      FirebaseAuth.instance.signOut();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage(),
      ),
      );

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.black26,
        content: Text('Your Password has been changed ... Login again!'),
      ),
      );

    }catch(error){


    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Password'),
      ),

      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
          child: ListView(
            children: [
              SizedBox(height: 200.0,),

              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'New Password',
                    hintText: 'Enter new Password',
                    labelStyle: TextStyle( fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle: TextStyle(color: Colors.black26,fontSize: 15.0),

                  ),
                  controller: newPasswordController,
                  validator: (value){
                   if (value == null || value.isEmpty){
                     return 'Please enter Password';

                   }
                   return null;
                  },
                ),
              ),
              ElevatedButton(onPressed: (){
                if(_formKey.currentState!.validate()){
                  setState(() {
                    newPassword = newPasswordController.text;
                  });
                  changePassword();
                }
              },
                  child: Text('Change Password',
                  style: TextStyle(fontSize: 18.0),
                  ),
              ),
            ],
          ),


        ),

      ),

    );
  }
}
