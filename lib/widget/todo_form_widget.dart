import 'package:date_time_picker/date_time_picker.dart';
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
              buildTitle(),
              SizedBox(height: 30),
              Text('Start date'),
              builStartDate(),
              SizedBox(height: 30),

              Text('End date'),
              builEndDate(),
              SizedBox(height: 16),
              // buildButton(),
            ],
          ),
        ),
      );

  Widget buildTitle() => TextFormField(
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
          border: UnderlineInputBorder(),
          // labelText: 'Title',
        ),
      );

  Widget builStartDate() => DateTimePicker(
        // initialValue: '',
        // dateMask: 'd MMM, yyyy',
        inputFormatters: [],
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
        initialValue: startDate,
        onChanged: onChangedStartDate,
        // dateLabelText: 'Date',
        // onChanged: (val) => print(val),
        validator: (val) {
          print(val);
          return null;
        },
        onSaved: (val) => print("val" + val),
      );
  // TextFormField(
  //       // maxLines: 1,
  //       // initialValue: startDate,
  //       // onChanged: onChangedStartDate,
  //       // decoration: InputDecoration(
  //       //   border: UnderlineInputBorder(),
  //       //   // labelText: 'Start Date',
  //       // ),
  //       onTap: () {
  //         showDatePicker(
  //             context: c,
  //             initialDate: new DateTime.now(),
  //             firstDate: new DateTime(2016),
  //             lastDate: new DateTime(
  //                 2019)); // Call Function that has showDatePicker()
  //       },
  //       // child: IgnorePointer(
  //       //   child: new TextFormField(
  //       //     decoration: new InputDecoration(hintText: 'DOB'),
  //       //     maxLength: 10,
  //       //     // validator: validateDob,
  //       //     onSaved: (String val) {},
  //       //   ),
  //       // ),
  //       // onTap: () {
  //       //   // Below line stops keyboard from appearing
  //       //   FocusScope.of(c).requestFocus(new FocusNode());

  //       //   // Show Date Picker Here
  //       //   showDatePicker(
  //       //       context: c,
  //       //       initialDate: new DateTime.now(),
  //       //       firstDate: new DateTime(2016),
  //       //       lastDate: new DateTime(2019));
  //       // },

  //     );

  Widget builEndDate() => DateTimePicker(
        // initialValue: '',
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
        initialValue: endDate,
        onChanged: onChangedEndDate,
        // dateLabelText: 'Date',
        // onChanged: (val) => print(val),
        validator: (val) {
          print(val);
          return null;
        },
        onSaved: (val) => print(val),
      );
  // TextFormField(
  //       maxLines: 1,
  //       initialValue: endDate,
  //       onChanged: onChangedEndDate,
  //       decoration: InputDecoration(
  //         border: UnderlineInputBorder(),
  //         // labelText: 'End Date',
  //       ),
  //     );

  // Widget buildButton() => SizedBox(
  //       width: double.infinity,
  //       child: ElevatedButton(
  //         style: ButtonStyle(
  //           backgroundColor: MaterialStateProperty.all(Colors.white),
  //         ),
  //         onPressed: onSavedTodo,
  //         child: Text('Save'),
  //       ),
  //     );
}
