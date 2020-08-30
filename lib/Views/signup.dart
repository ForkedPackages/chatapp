
import 'package:chatapp/Views/chatrooms.dart';
import 'package:chatapp/Widgets/widget.dart';
import 'package:chatapp/services/auth.dart';
import 'package:flutter/material.dart';

class  SignUp extends StatefulWidget {
  Function toggle;
  SignUp(this.toggle);
    @override
   _SignUpState createState() =>  _SignUpState();
}

class  _SignUpState extends State <SignUp> {
  bool tapping = false;
  AuthMethods _authMethods = new AuthMethods();
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();
  TextEditingController username = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  signUp()
  {
    
    if(formKey.currentState.validate())
      {
        Map<String,String> userInfo = {
        "name" : username.text,
        "email" : email.text,
        };
       setState(() {
         isLoading = true;
       });
      _authMethods.signUpWithEmailAndPassword(email.text, password.text).then((val){
        print(val);
        Navigator.pushReplacement(context,MaterialPageRoute(
          builder:(context) => Chat()));
      });
      }
}
  @override
   Widget build(BuildContext context) {
    return Scaffold(
    appBar:appbarmain(context, "SignIn") ,
    body:isLoading ? Container(child: Center(child: CircularProgressIndicator(),),):SingleChildScrollView(
    child:Container(
      height: MediaQuery.of(context).size.height-50,
      alignment: Alignment.bottomCenter,
      padding:EdgeInsets.symmetric(horizontal: 24),
      child:Column(
        mainAxisSize: MainAxisSize.min,
      children: <Widget>[
      Form(
      key:formKey,
      child:Column(children:<Widget>[
      TextFormField(
      validator: (val){
      return val.isEmpty || val.length < 4 ? "Your User Name should be at least 4 characters" : null;
      },
      controller: username,
      style: TextStyle(color: Colors.white),
      decoration:textFieldInputDecoration("UserName"),
         
    ), 
    TextFormField(
      validator: (val){
      return RegExp
      (r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val) ?
       null : "provide email";     
      },
      controller: email,
      style: TextStyle(color: Colors.white),
      decoration:textFieldInputDecoration("email"),
         
    ),
     TextFormField(
       obscureText: true,
       validator: (val){
       return val.length > 6 ? null : "more than 6 characters";
       },
       
       controller: password,
       style: TextStyle(color: Colors.white),
      decoration:textFieldInputDecoration("Password"),
         
    ),
    ],
    ),
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
    GestureDetector(
    onTap:() {signUp();},
    child:Container(
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
      child:Text("Sign Up",style:TextStyle(
      color:Colors.white,
      fontSize: 17,
      
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
        Colors.red,
        ]    
      ),
      borderRadius: BorderRadius.circular(30)),
      child:Text("Sign Up With Google",style:TextStyle(
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
      Text("have an account? ",style:TextStyle(
      color: Colors.white,fontSize: 10,
      ),
      ),
      GestureDetector(onTap: (){widget.toggle();},
      child:Text("SignIn Now",style:TextStyle(
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