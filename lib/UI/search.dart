import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {

TextEditingController search = TextEditingController();
final ref = FirebaseDatabase.instance.ref('Comment 2');


@override
  void dispose() {
    search.dispose();
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
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(30),
                child: TextFormField(
                  controller: search,
                  decoration: const InputDecoration(
                    hintText: 'Search',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: ((value) {
                    setState(() {
                      
                    });
                  }),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  height: 400,
                  width: double.maxFinite,
                  margin: const EdgeInsets.only(left :30,right:30),
                  color: Colors.deepPurple.withOpacity(0.2),
                  child : FirebaseAnimatedList(
                    query: ref, 
                    itemBuilder: (context, snapshot, animation, index) {
                     final title = snapshot.child('comment').value.toString();
                     if(search.text.isEmpty){
                      return Text(snapshot.child('comment').value.toString());
                     }
                     else if(title.toLowerCase().contains(search.text.toLowerCase())){
                      return Text(snapshot.child('comment').value.toString());
                     }
                     else{
                      return Container();
                     }
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}