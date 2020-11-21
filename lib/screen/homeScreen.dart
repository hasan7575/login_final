import 'package:flutter/material.dart';
import 'package:loginpage/constants.dart';
import 'package:loginpage/screen/widget/buttonWidget.dart';
import 'package:loginpage/screen/widget/textFieldWidget.dart';
import 'package:validators/validators.dart';

class HomeScreen extends StatelessWidget {
  var _formKey=GlobalKey<FormState>();
  var email;
  var password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {

    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          new Container(
              height: 200,
              alignment: Alignment.center,
              width: double.infinity,
              decoration: new BoxDecoration(
                color: mediumBlue,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(20)),
              ),
              child: new Text('Login',
                  style: new TextStyle(
                      color: whiteColor,
                      fontSize: 35,
                      fontWeight: FontWeight.w900))),
          new Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Form(
              key: _formKey,
               child: new Column(
                 crossAxisAlignment: CrossAxisAlignment.end,
                 children: [
                   new Container(
                       child: TextFieldWidget(
                         onSaved: (String value){
                           email=value;
                         },
                           validator: (String value) {
                             if(value.isEmpty){
                               return "Enter Email";
                             }else if(!isEmail(value)){
                               return "enter correct email";
                           }else{
                               return null;
                             }
                           },
                           labelText: "Email",
                           icon: Icons.email_outlined)),
                   new Container(
                       margin: EdgeInsets.only(top: 10),
                       child: TextFieldWidget(
                         onSaved: (String value){
                           password=value;
                         },
                         validator: (String value){
                           if(value.isEmpty){
                             return "enter Password";
                           }else if(value.length<6){
                             return "enter correct password";
                           }else{
                             return null;
                           }
                         },
                         labelText: "password",
                         icon: Icons.lock_outline,
                         obscureText: true,
                         suffixIcon: Icons.visibility_off,
                       )),
                   new Container(
                     margin: EdgeInsets.only(top: 10),
                     child: new Text(
                       'Forget Password',
                       style: new TextStyle(color: mediumBlue),
                     ),
                   ),
                   new Container(
                     margin: EdgeInsets.only(top: 15),
                     child:GestureDetector(
                        child:  ButtonWidget(
                          title: "Login",
                          hasBorder: false,
                        ),
                       onTap: (){
                         if( _formKey.currentState.validate()){
                           _formKey.currentState.save();
                           print('email: $email');
                           print('password: $password');
                         }

                       },
                     ),
                   ),
                   new Container(
                     margin: EdgeInsets.only(top: 15, bottom: 20),
                     child: ButtonWidget(
                       title: "Sign Up",
                       hasBorder: true,
                     ),
                   )
                 ],
               ),
            ),
          )
        ],
      ),
    );
  }
}
