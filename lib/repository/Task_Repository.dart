
import '../model/Task_Model.dart';

class TaskRepository{
  final List<TaskModel> _taskList=[
    TaskModel(
        0,
        "Study MVVM",
        "In order to avoid ugly state management libraries and collect continuously technical debt,",
        false),
  ];

  void addTask(TaskModel task){
    task.id=_taskList.length;
    _taskList.add(task);
  }
  void removeTask(TaskModel task){
    _taskList.remove(task);
  }
  void updateTask(TaskModel task){
    _taskList[_taskList.indexWhere((element) => element.id == task.id)]=task;
  }
  Future<List<TaskModel>> loadTasks() async {
    await Future.delayed(const Duration(seconds: 2));
    return Future.value(_taskList);
  }
}