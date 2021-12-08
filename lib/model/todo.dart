import 'package:flutter/cupertino.dart';

class TodoField {
  static const createdTime = 'createdTime';
}

class Todo {
  DateTime createdTime;
  String title;
  String id;
  // String description;
  String startDate;
  String endDate;
  String timeLeft;

  bool isDone;

  Todo({
    @required this.createdTime,
    @required this.title,
    // this.description = '',
    this.startDate = '',
    this.endDate = '',
    this.id,
    this.timeLeft = '',
    this.isDone = false,
  });
}
