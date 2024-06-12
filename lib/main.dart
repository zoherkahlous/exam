import 'package:exame/classes/home.dart';
import 'package:exame/classes/login.dart';
import 'package:flutter/material.dart';

import 'config/get_it_config.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  init();
  runApp(App());
}

late double width;
late double height;

class App extends StatelessWidget {
 const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.sizeOf(context).width;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Login());
  }
}
