import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/model/todo.dart';
import 'package:flutter_application_1/provider/todos.dart';
import 'package:flutter_application_1/widget/todo_form_widget.dart';

class EditTodoPage extends StatefulWidget {
  final Todo todo;

  const EditTodoPage({Key key, this.todo}) : super(key: key);

  @override
  _EditTodoPageState createState() => _EditTodoPageState();
}

class _EditTodoPageState extends State<EditTodoPage> {
  final _formKey = GlobalKey<FormState>();

  String title;
  String startDate;
  String endDate;

  bool isFirstTime = false;

  @override
  void initState() {
    super.initState();

    if (widget.todo != null) {
      print('test123' + widget.todo.title.toString());

      title = widget.todo.title;
      startDate = widget.todo.startDate;
      endDate = widget.todo.endDate;
      isFirstTime = false;
    } else {
      title = '';
      startDate = '';
      endDate = '';
      isFirstTime = true;
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Edit Todo'),
          actions: [
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                final provider =
                    Provider.of<TodosProvider>(context, listen: false);
                provider.removeTodo(widget.todo);

                Navigator.of(context).pop();
              },
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: TodoFormWidget(
              title: title,
              startDate: startDate,
              endDate: endDate,
              onChangedTitle: (title) => setState(() => this.title = title),
              onChangedStartDate: (startDate) =>
                  setState(() => this.startDate = startDate),
              onChangedEndDate: (endDate) =>
                  setState(() => this.endDate = endDate),
              // onSavedTodo: isFirstTime ? addTodo : saveTodo,
            ),
          ),
        ),
        bottomSheet: buildButton(),
      );

  void saveTodo() {
    final isValid = _formKey.currentState.validate();

    DateFormat dateFormat = DateFormat("dd MMM yyy");

    DateTime dateTime = DateFormat("yyyy-mm-dd").parse(startDate);
    String startDateFormat = dateFormat.format(dateTime);

    DateTime dateTime1 = DateFormat("yyyy-mm-dd").parse(endDate);
    String endDateFormat = dateFormat.format(dateTime1);

    final difference = daysBetween(dateTime, dateTime1);
    print("object1  " + "difference.toString()");

    if (!isValid) {
      return;
    } else {
      final provider = Provider.of<TodosProvider>(context, listen: false);

      provider.updateTodo(widget.todo, title, startDateFormat, endDateFormat,difference.toString());

      Navigator.of(context).pop();
    }
  }

  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return to.difference(from).inHours;
  }

//   getDifference(DateTime date1,DateTime date2) async {
//     print('date1 $date1');
//     print('date2 $date2');
//     print("${date1.difference(date2).inHours}");
//     return date1.difference(date2).inHours;
// }

  void addTodo() {
    final isValid = _formKey.currentState.validate();
    DateFormat dateFormat = DateFormat("dd MMM yyy");

    DateTime dateTime = DateFormat("yyyy-mm-dd").parse(startDate);
    String startDateFormat = dateFormat.format(dateTime);

    DateTime dateTime1 = DateFormat("yyyy-mm-dd").parse(endDate);
    String endDateFormat = dateFormat.format(dateTime1);

    final difference = daysBetween(dateTime, dateTime1);
    print("object1  " + difference.toString());

    if (!isValid) {
      return;
    } else {
      final todo = Todo(
        id: DateTime.now().toString(),
        title: title,
        startDate: startDateFormat,
        endDate: endDateFormat,
        timeLeft: difference.toString(),
        createdTime: DateTime.now(),
      );

      final provider = Provider.of<TodosProvider>(context, listen: false);
      provider.addTodo(todo);

      Navigator.of(context).pop();
    }
  }

  Widget buildButton() => SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
          ),
          onPressed: isFirstTime ? addTodo : saveTodo,
          child: Text('Save'),
        ),
      );
}
