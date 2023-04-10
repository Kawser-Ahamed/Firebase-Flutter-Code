import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter_firebase/UI/firestore_send_data.dart';
import 'package:test_flutter_firebase/UI/get_data_firestore.dart';
import 'package:test_flutter_firebase/UI/search.dart';
import 'package:test_flutter_firebase/UI/sendData.dart';
import 'package:test_flutter_firebase/UI/update_data.dart';
import 'package:test_flutter_firebase/firebase_options.dart';
import 'package:test_flutter_firebase/UI/get_Data2.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FirestoreGetData(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final firestore = FirebaseFirestore.instance.collection("person").snapshots();

  // Future getData() async{
  //   var firestore = FirebaseFirestore.instance;
  //   QuerySnapshot qn = await firestore.collection("person").get();
  //   print(qn.docs);
  //   return qn.docs;
  // }
   final CollectionReference ref = FirebaseFirestore.instance.collection('person');
  void printData() async{
    try{
      QuerySnapshot qn = await ref.get();
      qn.docs.forEach((element) {
        // ignore: avoid_print
        print(element.data());
      });
    }
    catch(e){
      // ignore: avoid_print
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        color: Colors.red,
        child: StreamBuilder<QuerySnapshot>(
          stream: firestore,
          builder: (context, snapshot) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                return Text(snapshot.data!.docs[index]['name']);
              },
            );
          },
        ),
      ),
    );
  }
}