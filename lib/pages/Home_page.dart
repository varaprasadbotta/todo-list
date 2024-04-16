import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todolist/components/MyListTile.dart';
import 'package:todolist/components/alertbox.dart';
import 'package:todolist/data/database.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
@override

  void initState() {
    if(_mybox.get("Todolist")==null){
      db.initialdata();
    }else{
      db.loadData();
    }
    super.initState();
  }

  //referal of database class
  TodolistDataBase db =TodolistDataBase();

  //rer of mybox
  final _mybox = Hive.box("MyBOx");

  //textcontroller
  final _controller = TextEditingController();

  //deleteTaskfromlist
  void deleteTaskfromlist(int index){
    setState(() {
     db.todolist.removeAt(index);
    });
    db.updateData();
  }

  //save Task
  void saveTask() {
    setState(() {
      db.todolist.insert(0,  [_controller.text, false]);
      _controller.clear();      
    });
    Navigator.of(context).pop();
    db.updateData();
  }

  //delete Task
  void deleteTask() {
    _controller.clear();
    Navigator.of(context).pop();
    db.updateData();
  }

  //taskform
  void taskform() {
    setState(() {
      showDialog(
          context: context,
          builder: (context) {
            return MyAlertBox(
              controller: _controller,
              saveButton: saveTask,
              deleteButton: deleteTask,
            );
          });
    });
  }

  //function checkboxclicked
  void checkboxTapped(int index) {
    setState(() {
      db.todolist[index][1] = !db.todolist[index][1];
    });
    db.loadData();
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: Text("ToDo List",
            style: GoogleFonts.athiti(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              color: Colors.blue,
            )),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: taskform,
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
        backgroundColor: Colors.blue.shade400,
      ),
      body: ListView.builder(
          itemCount: db.todolist.length,
          itemBuilder: (context, index) {
            return MyTileCard(
              text: db.todolist[index][0],
              istapped: db.todolist[index][1],
              onChanged: (value) => checkboxTapped(index),
              deletebutton:(value) =>deleteTaskfromlist(index) ,
            );
          }),
    );
  }
}
