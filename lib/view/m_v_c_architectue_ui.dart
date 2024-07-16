
import 'package:flutter/material.dart';

import '../view_model/MVC_Controller.dart';


class MVCArchitectueUi extends StatefulWidget {

  final MvcController controler;

  MVCArchitectueUi({
    super.key,
    required this.controler
  });


  @override
  State<MVCArchitectueUi> createState() => _MVCState();
}

class _MVCState extends State<MVCArchitectueUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MVC Architecture'),
        backgroundColor: Colors.lightGreenAccent,
      ),
      body: ListView.builder(
        itemCount: widget.controler.tasks.length,
        itemBuilder: (context,index){
          final task=widget.controler.tasks[index];
          return ListTile(
            title: Text(task.title),
            leading: Checkbox(
              value: task.completed,
              onChanged: (value){
                setState(() {
                  widget.controler.toggleTaslCompletion(index);
                });
              },
            ),
          );
      })
    );
  }
}
