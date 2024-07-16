
import 'package:advance_level_app/model/MVC_Model.dart';

class MvcController{
  List<MvcModel> tasks=[
    MvcModel('Task 1', false),
    MvcModel('Task 2', true),
    MvcModel('Task 3', false),
    MvcModel('Task 4', false),
    MvcModel('Task 5', true),
    MvcModel('Task 6', true),
    MvcModel('Task 7', false),
    MvcModel('Task 8', true),
    MvcModel('Task 9', false),
    MvcModel('Task 10', true),
  ];

  void toggleTaslCompletion(int index){
    tasks[index].completed = !tasks[index].completed;
  }
}