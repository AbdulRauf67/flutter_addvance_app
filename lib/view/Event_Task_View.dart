import 'package:advance_level_app/custom_MVVM/Event_Observer.dart';
import 'package:advance_level_app/model/Task_Model.dart';
import 'package:advance_level_app/repository/Task_Repository.dart';
import 'package:advance_level_app/view_model/Task_View_Model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class EventTaskView extends StatefulWidget {
  @override
  State<EventTaskView> createState() => _EventState();
}

class _EventState extends State<EventTaskView> implements EventObserver {

  final TaskViewModel _taskViewModel=TaskViewModel(TaskRepository());
  bool _isLoading = false;
  List<TaskModel> _tasks=[];

  @override
  void initState() {
    super.initState();
    _taskViewModel.subscribe(this);
  }
  @override
  void dispose() {
    _taskViewModel.unsubcribe(thi
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MVVM Example 2. TaskApp 2000 '),
        backgroundColor: Colors.lightGreenAccent,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _taskViewModel.loadTasks();
        },
        child: Icon(Icons.refresh),
      ),
      body: _isLoading ? Center(
        child: CircularProgressIndicator(),
      ) :
      ListView.builder(
        itemCount: _tasks.length,
        itemBuilder: (context,index){
          return ListTile(
            title: Text(_tasks[index].title),
            subtitle: Text(_tasks[index].description),
          );
        })
      ,
    );
  }

  @override
  void notify(ViewEvent event){
    if(event is LoadingEvent){
      setState(() {
        _isLoading=event.isLoading;
      });
    }else if(event is TasksLoadedEvent){
      setState(() {
        _tasks=event.tasks;
      });
    }
  }

}
