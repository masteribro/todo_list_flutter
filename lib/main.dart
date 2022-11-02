import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:todo_list/LocalStorage/session_manager.dart';
import 'package:todo_list/state/provider.dart';
import 'Pages/homepage.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await SessionManager.init();
  runApp(MultiProvider(providers: [

    ChangeNotifierProvider(create: (_)=> TodoProvider())
  ],
  child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}


