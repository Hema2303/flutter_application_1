import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TodoFormWidget extends StatelessWidget {
  final String title;
  final String startDate;
  final String endDate;

  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedStartDate;
  final ValueChanged<String> onChangedEndDate;

  // final VoidCallback onSavedTodo;

  const TodoFormWidget({
    Key key,
    this.title = '',
    this.startDate = '',
    this.endDate = '',
    @required this.onChangedTitle,
    @required this.onChangedStartDate,
    @required this.onChangedEndDate,
    // @required this.onSavedTodo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('To-Do Title'),
              SizedBox(height: 10),
              buildTitle(context),
              SizedBox(height: 30),
              Text('Start date'),
              SizedBox(height: 10),
              builStartDate(),
              SizedBox(height: 30),
              Text('End date'),
              SizedBox(height: 10),
              builEndDate(),
              SizedBox(height: 16),
            ],
          ),
        ),
      );

  Widget buildTitle(c) => Container(
        height: 100,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: TextFormField(
          maxLines: 1,
          initialValue: title,
          onChanged: onChangedTitle,
          validator: (title) {
            if (title.isEmpty) {
              return 'The title cannot be empty';
            }
            return null;
          },
          decoration: InputDecoration(
            border: InputBorder.none,
          ),
        ),
      );

  Widget builStartDate() => Container(
        height: 50,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: DateTimePicker(
          decoration: InputDecoration(
            border: InputBorder.none,
          ),
          dateMask: 'dd MMM yyy',
          inputFormatters: [],
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
          initialValue: startDate,
          onChanged: onChangedStartDate,
          validator: (val) {
            print(val);
            return null;
          },
          onSaved: (val) => print("val" + val),
        ),
      );

  Widget builEndDate() => Container(
        height: 50,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: DateTimePicker(
          decoration: InputDecoration(
            border: InputBorder.none,
          ),
          dateMask: 'dd MMM yyy',
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
          initialValue: endDate,
          onChanged: onChangedEndDate,
          validator: (val) {
            print(val);
            return null;
          },
          onSaved: (val) => print(val),
        ),
      );
}
