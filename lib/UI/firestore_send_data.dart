import 'package:flutter/material.dart';
import 'package:test_flutter_firebase/Backend/send_data_backend2.dart';

class FireStore extends StatefulWidget {
  const FireStore({super.key});

  @override
  State<FireStore> createState() => _FireStoreState();
}

class _FireStoreState extends State<FireStore> {

TextEditingController name = TextEditingController();
TextEditingController add = TextEditingController();

@override
  void dispose() {
    name.dispose();
    add.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body : Container(
          height: double.maxFinite,
          width: double.maxFinite,
          color: Colors.white,
          child: Column(
            children: [
              TextFormField(
                controller: name,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              TextFormField(
                controller: add,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                onChanged: ((value) {
                  setState(() {
                    
                  });
                }),
              ),
              ElevatedButton(
                onPressed: (){
                  Send2().sendData(name.text.toString(), add.text.toString());
                },
                 child: const Text("Send"),
                 )
            ],
          )
        )
      ),
    );
  }
}