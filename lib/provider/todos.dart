import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/model/todo.dart';

class TodosProvider extends ChangeNotifier {
  List<Todo> _todos = [
//     Todo(
//       createdTime: DateTime.now(),
//       title: 'Buy Food 😋',
//       description: '''- Eggs
// - Milk
// - Bread
// - Water''',
//     ),
//     Todo(
//       createdTime: DateTime.now(),
//       title: 'Plan family trip to Norway',
//       description: '''- Rent some hotels
// - Rent a car
// - Pack suitcase''',
//     ),
//     Todo(
//       createdTime: DateTime.now(),
//       title: 'Walk the Dog 🐕',
//     ),
//     Todo(
//       createdTime: DateTime.now(),
//       title: 'Plan Jacobs birthday party 🎉🥳',
//     ),
  ];

  List<Todo> get todos => _todos.toList();

  // List<Todo> get todosCompleted =>
  //     _todos.where((todo) => todo.isDone == true).toList();

  void addTodo(Todo todo) {
    _todos.add(todo);

    notifyListeners();
  }

  void removeTodo(Todo todo) {
    _todos.remove(todo);

    notifyListeners();
  }

  bool toggleTodoStatus(Todo todo) {
    todo.isDone = !todo.isDone;
    notifyListeners();

    return todo.isDone;
  }

  void updateTodo(Todo todo, String title, String startDate, String endDate,
      String timeLeft) {
    todo.title = title;
    todo.startDate = startDate;
    todo.endDate = endDate;
    todo.timeLeft = timeLeft;
    notifyListeners();
  }
}
