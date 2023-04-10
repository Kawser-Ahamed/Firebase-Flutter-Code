import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirestoreGetData extends StatefulWidget {
  const FirestoreGetData({super.key});

  @override
  State<FirestoreGetData> createState() => _FirestoreGetDataState();
}

class _FirestoreGetDataState extends State<FirestoreGetData> {

final firestore = FirebaseFirestore.instance.collection("Users").snapshots();
final ref = FirebaseFirestore.instance.collection("Users");

Future refernce()async{
  final ref = FirebaseFirestore.instance.collection("Users");
}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.maxFinite,
          width: double.maxFinite,
        child: StreamBuilder<QuerySnapshot>(
          stream: firestore,
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return const CircularProgressIndicator();
            }
            else if(snapshot.hasError){
              return const Text("Server Error");
            }
            else{
              return RefreshIndicator(
                onRefresh: refernce,
                child: ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  String name = snapshot.data!.docs[index]['name'].toString();
                  return InkWell(
                    onTap: (){
                      // ref.doc("Kawser").update({
                      //   'name' : "Now",
                      // });
                      ref.doc("Kawser").delete();
                    },
                    child: Card(
                      color: Colors.blue,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(name)),
                    ),
                  );
                },
              ),
              );
            }
          },
        ),
      ),
      ),
    );
  }
}