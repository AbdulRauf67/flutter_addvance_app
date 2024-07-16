import 'package:advance_level_app/view/Navigation_View.dart';
import 'package:advance_level_app/view/m_v_c_architectue_ui.dart';
import 'package:advance_level_app/view_model/MVC_Controller.dart';
import 'package:advance_level_app/view_model/navigation_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'helper/navigator.dart';

void main() {
  runApp(AdvanceLevelApp());
}

class AdvanceLevelApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NavigationViewModel>(create:(_)=>NavigationViewModel(NavigationService.instance))
      ],
      child: MaterialApp(
        navigatorKey: NavigationService.instance.navigationKey,
      debugShowCheckedModeBanner: false,
      title: 'Advance Level App',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: NavigationView(),
        )
    );
  }
}