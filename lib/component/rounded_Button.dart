import 'package:flutter/material.dart';
import 'package:wemeett/constant.dart';
class RoundedButton extends StatelessWidget {
 RoundedButton({this.textt,this.onPress});
 final String textt;
 final Function onPress;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Material(
          elevation: 5.0,
          color: Colors.white54,
          borderRadius: BorderRadius.circular(30.0),
          child: MaterialButton(
            onPressed: onPress,
            minWidth: 200.0,
            height: 42.0,
            child: Text(textt,
            style: ContentText),
          ),
        ),
    );
  }
}