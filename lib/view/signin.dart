import 'package:flutter/material.dart';
import 'package:quiz_maker_app/services/auth.dart';
import 'package:quiz_maker_app/view/signup.dart';
import 'package:quiz_maker_app/widgets/widgets.dart';

import 'home.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final _formKey = GlobalKey<FormState>();
  String email,password;
  AuthService authService = new AuthService();

  bool _isLoading = false;

  signIn() async
  {
    setState(() {
      _isLoading = true;
    });
    if(_formKey.currentState.validate()){
      await authService.signInEmailAndPass(email, password).then((val){
        if(val != null){
          setState(() {
            _isLoading = false;
          });
        }
      });
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: appBar(context),
        backgroundColor: Color(0xffE0E1EB),
        elevation: 0.0,
        brightness: Brightness.light,
      ),

      body: _isLoading? Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ) :Form(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              Spacer(),
              TextFormField(
                validator: (val){return val.isEmpty?'Enter the proper email':null;},
                decoration: InputDecoration(
                  hintText: 'E- mail'
                ),
                onChanged: (val)
                {
                  val = email;
                },
              ),
              SizedBox(height: 10.0,),
              TextFormField(
                obscureText: true,
                validator: (val) {return val.isEmpty?'Enter the correct password':null;},
                decoration: InputDecoration(
                  hintText: 'Password'
                ),
                onChanged: (val)
                {
                  val = password;
                },
              ),

              SizedBox(height: 10.0,),

              GestureDetector(
                onTap: ()
                {
                  signIn();
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xff24273F),
                    borderRadius: BorderRadius.circular(30)
                  ),
                  alignment: Alignment.center,
                  width: 150,
                  child: Text('Sign In',style: TextStyle(color: Colors.white,fontSize:16),),
                ),
              ),
              SizedBox(height: 15.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Don't have an account? " ,style: TextStyle(fontSize: 16.0,color: Colors.black),),
                  GestureDetector(
                      onTap: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUp()
                        ));
                      },
                      child: Text("Sign Up",style: TextStyle(fontSize: 16.0,color: Colors.black,decoration: TextDecoration.underline))),

                ],
              ),
              SizedBox(height: 100.0,),

            ],
          ),
        ),
      ),
    );
  }
}
