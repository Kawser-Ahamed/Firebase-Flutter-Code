import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class Update extends StatefulWidget {
  const Update({super.key});

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {

TextEditingController edit = TextEditingController();
final ref = FirebaseDatabase.instance.ref('Comment 2');

@override
  void dispose() {
    edit.dispose();
    super.dispose();
  }

Future showMyDialog(String comment,String id) async{
edit.text = comment;
  return showDialog(
    context: context, 
    builder: (context) {
      return AlertDialog(
        title: const Text("Update"),
        content: Container(
          color: Colors.transparent,
          child: TextFormField(
            controller: edit,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
            onChanged: (value){

            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: (){
              ref.child(id).update({
                'id' : id,
                'comment' : edit.text.toString(),
             });
             Navigator.pop(context);
          },
            child: const Text("Edit"),
          ),
          TextButton(
            onPressed: (){
              Navigator.pop(context);
          },
            child: const Text("Cancel"),
          ),
        ],
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FirebaseAnimatedList(
          query: ref, 
          itemBuilder: (context, snapshot, animation, index) {
            return Card(
              color: const Color.fromARGB(255, 194, 179, 233),
              child: ListTile(
                title: Text(snapshot.child('comment').value.toString()),
                subtitle: Text(snapshot.child('id').value.toString()),
                trailing: PopupMenuButton(
                  icon:  const Icon(Icons.more_vert),
                  itemBuilder: (context) =>[
                     PopupMenuItem(
                      child: ListTile(
                        onTap: (){
                          String comment = snapshot.child('comment').value.toString();
                          String id = snapshot.child('id').value.toString();
                          Navigator.pop(context);
                          showMyDialog(comment,id);
                        },
                        leading: const Icon(Icons.edit),
                        title: const Text("Edit"),
                      ),
                    ),
                     PopupMenuItem(
                      child: ListTile(
                        onTap: (){
                          Navigator.pop(context);
                          final id = snapshot.child('id').value.toString();
                          ref.child(id).remove();
                        },
                        leading: const Icon(Icons.delete),
                        title: const Text("Delte"),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}