import 'package:chatapp/Helper/authanticate.dart';
import 'package:chatapp/Views/search.dart';
import 'package:chatapp/Views/signin.dart';
import 'package:chatapp/Widgets/widget.dart';
import 'package:chatapp/services/auth.dart';
import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  AuthMethods _auth = new AuthMethods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("ChatRooms"),
        actions: <Widget>[
          GestureDetector(
          onTap:(){ _auth.signOut();
                  Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) => Authanticate(),),
                  );},
          child:Container(

            padding: EdgeInsets.symmetric(horizontal: 16),
          child:Icon(Icons.exit_to_app
          ),
          ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        onPressed:(){
           Navigator.pushReplacement(context,MaterialPageRoute(
          builder: (context) => Search(),
        )
        );
        },
      ),

  );
  }
}