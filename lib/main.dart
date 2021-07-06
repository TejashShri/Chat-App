import 'package:flutter/material.dart';
import 'register.dart';
import 'welcome.dart';
import 'login.dart';
import 'chat.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
   runApp(ChatUs());
}
class ChatUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute:'/',
      routes: {
        '/':(context)=>Welcome(),
        '/login':(context)=>Login(),
        '/reg':(context)=>Register(),
        '/chat':(context)=>ChatScreen(),
      },
    );
  }
}
