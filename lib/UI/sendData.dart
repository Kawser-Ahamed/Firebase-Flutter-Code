import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_flutter_firebase/Backend/send_data_backend.dart';

class SendData extends StatefulWidget {
  const SendData({super.key});

  @override
  State<SendData> createState() => _SendDataState();
}

class _SendDataState extends State<SendData> {

final _formKey = GlobalKey<FormState>();
TextEditingController id = TextEditingController();
TextEditingController comment = TextEditingController();
final reference = FirebaseDatabase.instance.ref('comment');


@override
  void initState() {
    super.initState();
  }
  
  @override
  void dispose() {
    id.dispose();
    comment.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          color: const Color.fromARGB(255, 106, 229, 238),
          child: Column(
            children: <Widget>[
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    controller: id,
                    decoration: const InputDecoration(
                      border:  OutlineInputBorder(),
                      hintText: "Enter Your Id",
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return "Please Enter Your Id";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    maxLines: 4,
                    controller: comment,
                    decoration: const InputDecoration(
                      border:  OutlineInputBorder(),
                      focusColor: Colors.red,
                      hintText: "Comment",
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return "Please Leave a Comment";
                      }
                      return null;
                    },
                  ),
                ),
                  ],
                )
              ),
              ElevatedButton(
                onPressed: (){
                  Send().sendData(id.text.toString(), comment.text.toString());
                },
                 child: const Text("Comment"),
              ), 
            ],
          ),
        ),
      ),
    );
  }
}