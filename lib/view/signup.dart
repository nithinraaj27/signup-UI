import 'package:flutter/material.dart';
import 'package:quiz_maker_app/services/auth.dart';
import 'package:quiz_maker_app/view/signin.dart';
import 'package:quiz_maker_app/widgets/widgets.dart';
import 'home.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  String email,password,name;
  AuthService authService = new AuthService();
  bool _isLoading = false;

  signUp() async
  {
    if(_formKey.currentState.validate())
    {
      setState(() {
        _isLoading =  true;
      });
      await authService.signInEmailAndPass(email, password).then((value)
      {
        if(value != null)
        {
          setState(() {
            _isLoading = false;
          });
          Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) => Home()
          ));
        }
      });
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

      body: _isLoading ? Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ):
      Form(
        key: _formKey,
        child: Container(
          padding:EdgeInsets.symmetric(horizontal: 24,),
          color: Color(0xffEBEDFD),
          child: Column(
            children: [
              Spacer(),
              TextFormField(
                validator: (val) { return val.isEmpty?'Enter Name properly':null;},
                decoration: InputDecoration(
                    hintText: 'Name'
                ),
                onChanged: (val) {
                  name = val;
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                validator: (val){ return val.isEmpty ?"Enter E-mail id" : null;},
                decoration: InputDecoration(
                    hintText: 'E-mail'
                ),
                onChanged: (val){
                  email = val;
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                obscureText: true,
                validator: (val){return val.isEmpty?'Enter the correct password' : null;},
                decoration: InputDecoration(
                    hintText: 'Password'
                ),
                onChanged: (val){
                  password = val;
                },
              ),
              SizedBox(
                height: 14.0,
              ),
              GestureDetector(
                onTap: (){
                  signUp();
                },
                child: Container(
                  height: 50,
                  padding:EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                      color: Color(0xff24273F),
                      borderRadius: BorderRadius.circular(15)
                  ),
                  alignment: Alignment.center,
                  width: 250,
                  child: Text("Sign Up",style: TextStyle(color: Colors.white,fontSize: 16.0),),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account? ",style: TextStyle(fontSize: 16.0,color: Colors.black),),
                  GestureDetector(
                      onTap: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignIn()
                        ));
                      },
                      child: Text("Sign In",style: TextStyle(fontSize: 16.0,color: Colors.black,decoration: TextDecoration.underline),)),
                ],
              ),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
