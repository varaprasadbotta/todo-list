import 'package:flutter/material.dart';
import 'package:todolist/components/button.dart';

class MyAlertBox extends StatelessWidget {
  void Function()? saveButton;
  void Function()? deleteButton;
  final  TextEditingController controller;
  MyAlertBox({super.key, this.saveButton,this.deleteButton,required this.controller});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blue.shade100,
      content: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //textfield
             TextField(              
              controller: controller,
              decoration:  InputDecoration(
                
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: "Add Task..",
                  hintStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white)),
            ),
            SizedBox(
              height: 40,
            ),
            //save button
            Row(
              children: [
                Mybutton(
                  buttonName: "Save",
                  onPressed:saveButton,
                ),
                Spacer(),
                //delete button
                Mybutton(
                  buttonName: "Delete",
                  onPressed: deleteButton,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
