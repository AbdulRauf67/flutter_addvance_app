

import 'package:advance_level_app/custom_MVVM/Event_Observer.dart';

abstract class EventViewModel {
  final List<EventObserver> _observerList=List.empty(growable: true);

  void subscribe(EventObserver observer){
    if(_observerList.contains(observer)) {
      return ;
    }

    _observerList.add(observer);
  }

  bool unsubcribe(EventObserver observer){
    if(_observerList.contains(observer)){
      _observerList.remove(observer);
      return true;
    }else{
      return false;
    }
  }

  void notify(ViewEvent event){
    for(var element in _observerList){
      element.notify(event);
    }
  }

}