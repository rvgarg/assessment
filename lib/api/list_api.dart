import 'package:assessment/models/todo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListApi {
  late final CollectionReference db;

  ListApi() {
    db = FirebaseFirestore.instance.collection('todo');
  }

  void addTodo({required Todo todo, required BuildContext context}) async {
    await db.add(todo.toJSON()).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('TODO added!!'),
      ));
      Navigator.of(context).pop();
    }).catchError((onError) {
      print(onError);
    });
  }

  void updateTodo({required Todo todo, required BuildContext context}) async {
    await db.doc(todo.id).set(todo.toJSON()).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('TODO updated!!'),
      ));
      Navigator.of(context).pop();
    }).catchError((onError) {
      print(onError);
    });
  }

  void deleteTodo({required Todo todo, required BuildContext context}) async {
    await db.doc(todo.id).delete().then((value) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('TODO deleted!!'),
      ));
      Navigator.of(context).pop();
    }).catchError((onError) {
      print(onError);
    });
  }
  
  getTodo() async {
    return db.limit(10).snapshots();
  }
}
