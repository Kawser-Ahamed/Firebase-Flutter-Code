import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class GetData extends StatefulWidget {
  const GetData({super.key});

  @override
  State<GetData> createState() => _GetDataState();
}

class _GetDataState extends State<GetData> {

final ref = FirebaseDatabase.instance.ref('Comment 2');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: const Color.fromARGB(255, 152, 243, 231),
          child: FirebaseAnimatedList(
            query: ref,
            itemBuilder: (context, snapshot, animation, index) {
              return Card(
                child: ListTile(
                  title: Text(snapshot.child('id').value.toString()),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}