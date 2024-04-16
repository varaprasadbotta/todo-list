import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MyTileCard extends StatelessWidget {
  bool? istapped;
  String text;
  void Function(bool?)? onChanged;
  void Function(BuildContext)? deletebutton;
  void Function(BuildContext)? sharebutton;
  MyTileCard({
    super.key,
    this.istapped,
    this.onChanged,
    required this.text,
    this.deletebutton,
    this.sharebutton,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Slidable(
        endActionPane: ActionPane(motion: DrawerMotion(), children: [
          SlidableAction(
            onPressed: deletebutton,
            icon: Icons.delete,
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            label: "delete",
            borderRadius: BorderRadius.circular(12),
          ),
          SlidableAction(
            onPressed: sharebutton,
            icon: Icons.share,
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            label: "share",
            borderRadius: BorderRadius.circular(12),
          )
        ]),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.blue.shade100,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.blue.shade400)),
          child: Row(
            children: [
              //checkbox
              Checkbox(
                value: istapped,
                onChanged: onChanged,
                checkColor: Colors.white,
                activeColor: Colors.black,
              ),
              //text
              Text(
                text,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: istapped! ? Colors.black38 : Colors.black,
                    decoration: istapped!
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
