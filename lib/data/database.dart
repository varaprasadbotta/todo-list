import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
class TodolistDataBase{
  //starting list will be empty
  List todolist=[];

  //reference of Mybox
  final _mybox = Hive.box("MyBox");

  //it it when the user first time visit the data
  void initialdata(){
    List todolist = [
    ["Do workout", false],
    ["Do Exercise", false]
  ];
  }
  //load data when data init
  void loadData(){
     todolist = _mybox.get("Todolist");
  }

  //update the data user did any changes
  void updateData(){
      _mybox.put("Todolist",todolist);
  }

}