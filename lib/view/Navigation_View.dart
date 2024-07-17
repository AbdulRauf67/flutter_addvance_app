import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/navigation_view_model.dart';


class NavigationView extends StatefulWidget {
  @override


  State<NavigationView> createState() => _NavigationState();
}

class _NavigationState extends State<NavigationView> {
  @override
  Widget build(BuildContext context) {
    final navController=Provider.of<NavigationViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Advance Level App'),
        backgroundColor: Colors.lightGreenAccent,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Image.asset('lib/res/images/imgfile.png',
              fit: BoxFit.cover,
            )
          ),
          ListTile(
            onTap: (){
              navController.navigateToMVC_Architecture();
             //Navigator.push(context,  MaterialPageRoute(builder: (context) => Studentsdata()));
            },
            leading:Icon(Icons.architecture),
            title:Text('Example MVC Architecture'),
          ),
          ListTile(
            leading:Icon(Icons.person),
            title:Text('Person MVVM'),
            onTap: (){
              navController.navigateToPersonMVVM();
            },
          ),
        ]
    ),
          ),
      body: SafeArea(
        child: Column(),
      ),
    );
  }
}
