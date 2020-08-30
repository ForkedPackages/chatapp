import 'dart:js';

import 'package:chatapp/Widgets/widget.dart';
import 'package:chatapp/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
DataBaseMethods db = new DataBaseMethods();
QuerySnapshot searchsnap;
insitateSearch()
{
   db.getUsers(searchTextEditingController.text).then((val){
   setState(() {     
   searchsnap = val;
   });
   });
}
Widget sList()

{
  return ListView.builder(
  shrinkWrap: true;,
  itemCount: searchsnap.documents.length,
  itemBuilder: (context,index){
  return  SearchTile(
    username: searchsnap.documents[index].data["name"],
    userEmail:searchsnap.documents[index].data["email"],
  );
  }   
  );
}
  TextEditingController searchTextEditingController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarmain(context, ""),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
            padding: EdgeInsets.symmetric(horizontal: 24,vertical: 16),
            color:Colors.grey,
            child: Row(children:[
            Expanded(
            child:TextField(
              controller: searchTextEditingController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Search Username.....",
                hintStyle: TextStyle(
                color: Colors.white,
                  ), 
                border: InputBorder.none
                ),
              ),
            ),
            GestureDetector(onTap: insitateSearch(),
            child:Icon(Icons.search,color: Colors.grey,
                ),
               ),
              ],
             ),
            ),
          ],
        ),
      ),
    );
  }
}
class SearchTile extends StatelessWidget {
  final String username;
  final String userEmail;
  SearchTile({this.username,this.userEmail});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: <Widget>[
        Column(children: <Widget>[
          Text(username),
          Text(userEmail),
        ],),
        Spacer(),
        Container(
        decoration: BoxDecoration(color: Colors.blue,
        borderRadius: BorderRadius.circular(30)),
        padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        )
      ],),
    );
  }
}