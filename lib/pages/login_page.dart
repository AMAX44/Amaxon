import 'package:catalog_app/utilis/routes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String name = ''; 
  bool changeButton = false;
  final _formkey = GlobalKey <FormState> ();

  moveToHome(BuildContext context )async{
    if(_formkey.currentState!.validate()){
    setState((){
        changeButton = true;
      });
      await Future.delayed(Duration(seconds:1)); //wait till the animation is complete
      await Navigator.pushNamed(context, MyRoutes.homeRoute); //if we get back, animation should reset
       setState(() {
        changeButton = false;
     }); 
    }                         
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.canvasColor,
      child: SingleChildScrollView(
        child: Form(
          key :_formkey,
          child: Column(
            children: [
              Image.asset(
                'assets/images/hey.png',
                fit: BoxFit.cover,
              ),
              
              SizedBox(
                height: 20.0,
              ),
              
              Text (
                'WELCOME $name',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontSize: 30,
                ),
              ),
              
              SizedBox(
                height: 20.0,
              ),
              
              Padding(
                padding: const EdgeInsets.symmetric(vertical:16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                      labelText: 'Username',
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                      hintText: 'Enter Username',
                      border: OutlineInputBorder(),
                      ),
                      validator: (value){
                        if (value!.isEmpty){
                          return ('Username cannot be empty');
                        }
                        // else if (!value.contains('@')){
                        //   return ('Enter valid Email Address');
                        // }
                        return null;
                      },
                      onChanged: (value){
                        name = value;
                        setState(() {
                          
                        });
                      },
                    ),
              
                    SizedBox(
                      height: 10.0,
                    ),
              
                    TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(fontWeight: FontWeight.bold),
                        hintText: 'Enter Password',
                        border: OutlineInputBorder(),
                      ),
                       validator: (value){
                        if (value!.isEmpty){
                          return ('Password cannot be empty');
                        }
                        else if (value.length<6){
                          return ('Password must contain atleast 6 charectors');
                        }

                        return null;
                      },
                    ),
        
                    SizedBox(
                      height: 10.0,
                    ),
                    
                    Material(
                      color: context.theme.buttonColor,
                      borderRadius: BorderRadius.circular(changeButton? 50 : 8),
                      child: InkWell(           //for onTap feature on animated container
                        onTap: () => moveToHome(context),
                        child: AnimatedContainer (
                          duration: Duration(seconds: 1),
                          height: 50,
                          width: changeButton? 50 : 150,
                          alignment: Alignment.center,
                          child: changeButton?Icon(Icons.done, color: Colors.white,) : Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
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