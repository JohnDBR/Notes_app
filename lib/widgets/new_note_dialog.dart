import 'package:flutter/material.dart';
import 'package:notes_app/model/note.dart';
import 'package:notes_app/widgets/note_type_dropdown.dart';

class NewNoteDialog extends StatefulWidget {
  
  @override
   _NewNoteDialogState createState() => _NewNoteDialogState();
}
class _NewNoteDialogState extends State<NewNoteDialog> {

  String _dropSelected = "DEFAULT";
  final controllerTitle = new TextEditingController();
  final controllerBody = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[200],
      title: Text(
       'New note',
       style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 20.0),
      ),
      content: Column(children: <Widget>[
       TextField(
         controller: controllerTitle,
         autofocus: true,
         decoration: new InputDecoration(
             labelText: 'Title'),
         onChanged: (value) {
           // teamName = value;
         },
       ),
       TextField(
         controller: controllerBody,
         decoration: new InputDecoration(
             labelText: 'Body'),
         onChanged: (value) {
           // teamName = value;
         },
       ),
       NoteTypeDropdown(
         selected: _dropSelected,
         onChangedValue: (value) => setState(() {
           _dropSelected = value;
       })),
       Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FlatButton(
          child: Text(
            "Cancel",
            style: TextStyle(color: Colors.black),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
            FlatButton(
              child: Text(
                "Add",
                style: TextStyle(color: Colors.green),
              ),
              onPressed: () {
                final note = new Note(
                  title: controllerTitle.value.text,
                  body: controllerBody.value.text,
                  completed: 0,
                  type: _dropSelected
                );
                controllerTitle.clear();
                controllerBody.clear();

                Navigator.of(context).pop(note);
            })
          ]
        )]
      )
    );
  }
}