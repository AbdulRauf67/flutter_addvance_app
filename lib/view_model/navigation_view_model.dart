

import 'package:advance_level_app/helper/navigator.dart';
import 'package:advance_level_app/view/Person_List_View.dart';
import 'package:flutter/widgets.dart';

import '../view/m_v_c_architectue_ui.dart';
import 'MVC_Controller.dart';

class NavigationViewModel extends ChangeNotifier{

  final MvcController controller=MvcController();
  final NavigationService _navigationService;
  NavigationViewModel(this._navigationService);


  navigateToMVC_Architecture(){
    _navigationService!.navigate(MVCArchitectueUi(controler: controller,));
  }
  navigateToPersonMVVM(){
    _navigationService!.navigate(PersonListView());
  }

}