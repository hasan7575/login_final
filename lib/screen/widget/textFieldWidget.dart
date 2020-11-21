import 'package:flutter/material.dart';

import '../../constants.dart';

class TextFieldWidget extends StatelessWidget {
  final String labelText;
  final icon;
  final bool obscureText;
  final suffixIcon;
  final Function validator;
  final Function onSaved;
  TextFieldWidget({@required this.labelText,@required this.icon,this.obscureText=false,this.suffixIcon,this.validator,this.onSaved});
  @override
  Widget build(BuildContext context) {
    return Container(
      child:  TextFormField(
        validator: validator,
        onSaved:onSaved ,
        style: new TextStyle(
          fontSize: 14,
          color: mediumBlue,
        ),
        obscureText: obscureText,
        decoration: InputDecoration(
            labelText: labelText,
            labelStyle: new TextStyle(
              color: mediumBlue,
            ),
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: mediumBlue,
              ),
            ),
          prefixIcon: Icon(icon,size: 16,color: mediumBlue,),
          suffixIcon: Icon(suffixIcon,size: 16,color: mediumBlue,),
        ),
      ),
    );
  }
}
