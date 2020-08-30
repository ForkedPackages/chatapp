import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseMethods
{
  getUsers(String username)
  {
Firestore.instance.collection("users")
   .where("name",isEqualTo: username).getDocuments();
  }
  uploadUserInfo(userMap)
   {
   Firestore.instance.collection("users")
   .add(userMap);
   }
}