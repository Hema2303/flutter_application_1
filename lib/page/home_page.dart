import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/page/edit_todo_page.dart';
import 'package:flutter_application_1/widget/todo_list_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // final tabs = [
    //   TodoListWidget(),
    // ];

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text(MyApp.title),
      ),
      body: TodoListWidget(),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        backgroundColor: Colors.orange[700],
        onPressed: () => showDialog(
          context: context,
          builder: (context) => EditTodoPage(),
          barrierDismissible: false,
        ),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
