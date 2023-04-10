import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Send2{

  final firestore = FirebaseFirestore.instance.collection("Users");

  sendData(String name,String add){
    firestore.doc(name).set({
      'name' : name,
      'address' : add,
    }).then((value) {
      Fluttertoast.showToast(msg: "Send");
    }).then(( error){
    });
  }
}