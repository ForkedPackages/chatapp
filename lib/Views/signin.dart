import 'package:flutter/material.dart';
import 'package:chatapp/Widgets/widget.dart';

 class Signin extends StatefulWidget {
  Function toggle;
  Signin(this.toggle);
  @override
  _State createState() => _State();
}
 
class _State extends State<Signin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar:appbarmain(context, "SignIn") ,
    body:SingleChildScrollView(
    child:Container(
      height: MediaQuery.of(context).size.height-50,
      alignment: Alignment.bottomCenter,
      padding:EdgeInsets.symmetric(horizontal: 24),
      child:Column(
        mainAxisSize: MainAxisSize.min,
      children: <Widget>[
    TextField(
      style: TextStyle(color: Colors.white),
      decoration:textFieldInputDecoration("email"),
         
    ),
     TextField(
       style: TextStyle(color: Colors.white),
      decoration:textFieldInputDecoration("Password"),
         
    ),
    SizedBox(
    height: 8,
    ),
    Container(alignment: Alignment.centerRight,
    child:Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 9),
      child: Text("ForgetPassword",style: TextStyle(color: Colors.white
       ),
      ),
      ),
    ),
    SizedBox(
    height: 8,
    ),
    Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width ,
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
        colors: [
        Colors.yellowAccent,
        Colors.orangeAccent,
        ]    
      ),
      borderRadius: BorderRadius.circular(30)),
      child:Text("Sign In",style:TextStyle(
      color:Colors.white,
      fontSize: 17,
      
      ),
      ),
      
      ),
      SizedBox(
    height: 8,
    ),
    Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width ,
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
        colors: [
        Colors.yellowAccent,
        Colors.red,
        ]    
      ),
      borderRadius: BorderRadius.circular(30)),
      child:Text("Sign In With Google",style:TextStyle(
      color:Colors.white,
      fontSize: 17,
      
      ),
      ),
      
      ),
      SizedBox(
    height: 20,
    ),
    Row(mainAxisAlignment: MainAxisAlignment.center  ,
      children: <Widget>[
      Text("Dont have account? ",style:TextStyle(
      color: Colors.white,fontSize: 10,
      ),
      ),
      GestureDetector(onTap: (){widget.toggle();},
      child:Text("Register Now",style:TextStyle(
      color: Colors.white,fontSize: 10,decoration: TextDecoration.underline,
      ),
      ),
      ),
     SizedBox(
    height: 70,
    )],)
      
    ],
    )
    ,
    ),
    ),
    );
  
}
InputDecoration textFieldInputDecoration(String h)
{
  return  InputDecoration(
           hintText:h
          ,hintStyle: TextStyle(
            color: Colors.white54
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
              color: Colors.white),),
              enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
              color: Colors.white)
              ,)
            );
        
}
}