import 'package:flutter/material.dart';
import 'constant.dart';
import 'register.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:wemeett/component/rounded_Button.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> with SingleTickerProviderStateMixin{

AnimationController controller;

@override
  void initState() {
    super.initState();

    controller= AnimationController(
      duration: Duration(
      seconds:2,
      ),
      vsync:this,
      upperBound: 100.0
      );
      controller.forward();
      controller.addListener((){
        setState(() {
          
        });
        
      });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: Colors.black26,
        title:Center(child: 
        TyperAnimatedTextKit(
          text:['WE','MEET'],
          textStyle: TextStyle(
            fontFamily:'Bobbers',
          ),
          )
          ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Hero(
              tag: 'logo',
               child: Container(
              child:Image.asset('images/logo.png'),
              height: controller.value,
            ),
          ),
          Center(
            child: TyperAnimatedTextKit(
            text:['WE MEET'],
            textStyle: HeadText
            ),
          ),
          RoundedButton(
            textt: 'Login',
            onPress:(){
              Navigator.pushNamed(context,'/login');
            }
          ),
          RoundedButton(
            textt: 'Register',
            onPress:(){
              Navigator.push(context,MaterialPageRoute(
              builder: (context)=>Register()
              )
              );
            }
          ),
        ],
      )
    ),
    );
  }
}

