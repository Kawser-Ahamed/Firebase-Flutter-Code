import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class GetData2 extends StatefulWidget {
  const GetData2({super.key});

  @override
  State<GetData2> createState() => _GetData2State();
}

class _GetData2State extends State<GetData2> {

  final ref = FirebaseDatabase.instance.ref('Comment 2');
  // Map<dynamic,dynamic> map  = {'key1' : 'values'};

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body : Container( 
          height: double.maxFinite,
          width: double.maxFinite,
          child: StreamBuilder(
            stream: ref.onValue,
            builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
              if(snapshot.hasData){
              Map<dynamic,dynamic> map = snapshot.data!.snapshot.value as dynamic;
              List<dynamic> list=[];
              list.clear();
              list = map.values.toList();
              return ListView.builder(
                itemCount: snapshot.data!.snapshot.children.length,
                itemBuilder: (context, index) {
                  return Text(list[index]['comment']);
                },
              );
              }
              else if(snapshot.hasError){
                return const Center(child : CircularProgressIndicator());
              }
              else{
                return const Center(child : CircularProgressIndicator());
              }
            },
          ),
        )
      ),
    );
  }
}