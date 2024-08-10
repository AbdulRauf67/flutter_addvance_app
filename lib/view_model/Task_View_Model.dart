
import 'package:advance_level_app/custom_MVVM/Event_Observer.dart';
import 'package:advance_level_app/custom_MVVM/Event_View_Model.dart';
import 'package:advance_level_app/repository/Task_Repository.dart';

import '../model/Task_Model.dart';

class TaskViewModel extends EventViewModel {
  TaskRepository _taskRepository;

  TaskViewModel(this._taskRepository);

  void loadTasks(){
    notify(LoadingEvent(isLoading: true));
    _taskRepository.loadTasks().then((value){
      notify(TasksLoadedEvent(tasks: value));
      notify(LoadingEvent(isLoading: false));
    });
  }

  void createTask(String title, String description){
    notify(LoadingEvent(isLoading: true));
    TaskModel task=TaskModel(1, title, description, true);
    notify(TaskCreatedEvent(task));
    notify(LoadingEvent(isLoading: false));
  }
}

class LoadingEvent extends ViewEvent {
  bool isLoading;

  LoadingEvent({required this.isLoading}) : super ("LoadingEvent");
}

class TasksLoadedEvent extends ViewEvent {
  final List<TaskModel> tasks;

  TasksLoadedEvent({required this.tasks}): super("TasksLoadedEvent");
}

class TaskCreatedEvent extends ViewEvent {
  final TaskModel tasks;

  TaskCreatedEvent(this.tasks): super("TaskCreatedEvent");
}