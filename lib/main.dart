import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/page/home_page.dart';
import 'package:flutter_application_1/provider/todos.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static final String title = 'To-Do List';

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => TodosProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: title,
          theme: ThemeData(
            primarySwatch: Colors.yellow,
            scaffoldBackgroundColor: Color(0xFFf6f5ee),
          ),
          home: HomePage(),
        ),
      );
}
