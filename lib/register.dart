import 'package:flutter/material.dart';
import 'package:wemeett/component/rounded_Button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
class Register extends StatefulWidget {

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black26,
        title:Center(child: Text('ChatUS')),
      ),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SafeArea(
          child: Column(
            mainAxisAlignment:MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
                tag: 'logo',
                 child: Container(
                child:Image.asset('images/logo.png'),
                height: 200.0,
              ),
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (value){
                email=value;
              },
            decoration: InputDecoration(
              hintText:'Enter your Email',
              contentPadding: EdgeInsets.symmetric(vertical:20.0,horizontal:20.0),
              border:OutlineInputBorder(
                borderRadius:BorderRadius.circular(32.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32.0),
                borderSide: BorderSide(color:Colors.blueAccent,width:1.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32.0),
                borderSide: BorderSide(color:Colors.blueAccent,width:2.0),
              )
            ),
            ),
            SizedBox(height: 20.0),
            TextField(
              obscureText: true,
              textAlign: TextAlign.center,
              onChanged: (value){
                password = value;
              },
            decoration: InputDecoration(
              hintText:'Password',
              contentPadding: EdgeInsets.symmetric(vertical:20.0,horizontal:20.0),
              border:OutlineInputBorder(
                borderRadius:BorderRadius.circular(32.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32.0),
                borderSide: BorderSide(color:Colors.blueAccent,width:1.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32.0),
                borderSide: BorderSide(color:Colors.blueAccent,width:2.0),
              )
            ),
            ),
            RoundedButton(
              textt:'Register',
              onPress: () async{
                setState(() {
                  showSpinner = true;
                  });
                try{
              final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
              if(newUser != null)
              {
                Navigator.pushNamed(context,'/chat');
              }
              setState(() {
              showSpinner= false;                
              });
              }
              catch (e) {
                print(e);
              }
              },
              ),
          ],
        )
    ),
      ),
    );
  }
}