import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:modul_6/add_todo.dart';
import 'package:modul_6/main.dart';

import 'models/todo_model.dart';

class Todolist extends StatefulWidget {
  const Todolist({super.key});

  @override
  State<Todolist> createState() => _TodolistState();
}

class _TodolistState extends State<Todolist> {
  late Box<TodoModel> _myBox;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _myBox = Hive.box(boxName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo list"),
      ),
      body: ValueListenableBuilder(
          valueListenable: _myBox.listenable(),
          builder: (BuildContext context, value, _) {
            if (_myBox.values.isEmpty) {
              return Center(
                child: Text("File Empty"),
              );
            }
            return ListView.builder(
                itemCount: _myBox.values.length,
                itemBuilder: (context, index) {
                  TodoModel? res = _myBox.getAt(index);
                  return Dismissible(
                    onDismissed: (direction){
                      _myBox.deleteAt(index);
                    },
                    background: Container(
                      color: Colors.red,
                    ),
                    key: UniqueKey(),
                    child: ListTile(
                        title: Text("Title ${res!.title}"),
                        subtitle: Text("${res!.description}")),
                  );
                });
          }),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) {
              return AddTodo();
            }));
          },
          child: Icon(Icons.add)),
    );
  }
}
