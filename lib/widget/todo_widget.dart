import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/model/todo.dart';
import 'package:flutter_application_1/page/edit_todo_page.dart';
import 'package:flutter_application_1/provider/todos.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;

  const TodoWidget({
    @required this.todo,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Slidable(
          actionPane: SlidableDrawerActionPane(),
          key: Key(todo.id),
          actions: [
            IconSlideAction(
              color: Colors.green,
              onTap: () => editTodo(context, todo),
              caption: 'Edit',
              icon: Icons.edit,
            )
          ],
          secondaryActions: [
            IconSlideAction(
              color: Colors.red,
              caption: 'Delete',
              onTap: () => deleteTodo(context, todo),
              icon: Icons.delete,
            )
          ],
          child: buildTodo(context),
        ),
      );

  Widget buildTodo(BuildContext context) => GestureDetector(
        onTap: () => editTodo(context, todo),
        child: Column(
          children: [
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          // todo.title,
                          'Automated testing Script',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        // if (todo.description.isNotEmpty)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Start Date',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(todo.startDate)
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  'End Date',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(todo.endDate)
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  'Time Left',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(todo.timeLeft + 'hrs') // Container(
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 30,
              color: Colors.yellow[100],
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Status : ',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      Text(
                        todo.isDone ? 'Done' : 'Incomplete',
                        style: TextStyle(fontSize: 12, color: Colors.black),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Tick if completed:',
                        style: TextStyle(fontSize: 12),
                      ),
                      Container(
                        // height: 5,
                        // width: 10,
                        child: Checkbox(
                          activeColor: Theme.of(context).primaryColor,
                          
                          checkColor: Colors.white,
                          value: todo.isDone,
                          onChanged: (_) {
                            final provider = Provider.of<TodosProvider>(context,
                                listen: false);
                            final isDone = provider.toggleTodoStatus(todo);

                            Utils.showSnackBar(
                              context,
                              isDone
                                  ? 'Task completed'
                                  : 'Task marked incomplete',
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      );

  void deleteTodo(BuildContext context, Todo todo) {
    final provider = Provider.of<TodosProvider>(context, listen: false);
    provider.removeTodo(todo);

    Utils.showSnackBar(context, 'Deleted the task');
  }

  void editTodo(BuildContext context, Todo todo) => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => EditTodoPage(todo: todo),
        ),
      );
}
