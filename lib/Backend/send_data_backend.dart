import 'package:firebase_database/firebase_database.dart';

class Send{

  final ref = FirebaseDatabase.instance.ref('Message');
  
  void sendData(String id,String comment) async{
    ref.child(id).set({
      'comment' : comment,
      'id' : id, 
    }).then((value){
      
    }).then((error){
      
    });
  }
}