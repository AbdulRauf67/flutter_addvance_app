import 'package:advance_level_app/model/Person.dart';
import 'package:advance_level_app/view_model/Person_View_Model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class PersonListView extends StatefulWidget {
  @override
  State<PersonListView> createState() => _PersonsState();
}

class _PersonsState extends State<PersonListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MVVM Architecture'),
        backgroundColor: Colors.lightGreenAccent,
      ),
      body:Consumer<PersonViewModel>(builder:
          (BuildContext context, PersonViewModel viewModel, Widget? child) {
        return ListView(
          children: [
           ListView.builder(
            itemCount: viewModel.persons.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context,index){
              final person=viewModel.persons[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: ListTile(
                    title: Text(person.name),
                    subtitle: Text(person.age.toString()),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => viewModel.removePerson(person),
                    ),
                    onTap: () => _showEditDialog(context,viewModel,person),
                  ),
                ),
              );
            }),
            SizedBox(height: 70,)
          ],
        );
        },
      ) ,

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _showAddDialog(context),
      ),
    );
  }
}

_showAddDialog(BuildContext context) {
  final nameController=TextEditingController();
  final ageController=TextEditingController();
  showDialog(context: context,
      builder: (context) => AlertDialog(
        title: Text('Add Person'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: ageController,
              decoration: InputDecoration(labelText: 'Age'),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
        actions: [
          TextButton(
              onPressed: ()=> Navigator.of(context).pop(),
              child: Text('Cencel')
          ),
          TextButton(
              onPressed: (){
                final name=nameController.text;
                final age=int.parse(ageController.text);
                final person=Person(name: name,age: age);
                final viewModel= Provider.of<PersonViewModel>(context,listen: false);
                viewModel.addPerson(person);
                Navigator.of(context).pop();
              },
              child: Text('Add')
          )
        ],
      )
  );
}

_showEditDialog(BuildContext context,
    PersonViewModel viewModel, Person person) {

  final nameController=TextEditingController(text: person.name);
  final ageController=TextEditingController(text: person.age.toString());
  showDialog(context: context,
      builder: (context) => AlertDialog(
        title: Text('Edit Person'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: ageController,
              decoration: InputDecoration(labelText: 'Age'),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
        actions: [
          TextButton(
              onPressed: ()=> Navigator.of(context).pop(),
              child: Text('Cencel')
          ),
          TextButton(
              onPressed: (){
                final name=nameController.text;
                final age=int.parse(ageController.text);
                final newPerson=Person(name: name,age: age);
                //final viewModel= Provider.of<PersonViewModel>(context,listen: false);
                viewModel.updatePerson(person,newPerson);
                Navigator.of(context).pop();
              },
              child: Text('Save')
          )
        ],
      )
  );


}

