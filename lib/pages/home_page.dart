import 'package:notes_app/model/note.dart';
import 'package:notes_app/widgets/new_note_dialog.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Note> notes = new List<Note>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes App"),
      ),
      body: _list(),
      floatingActionButton: new FloatingActionButton(
          onPressed: () => _addNote(),
          tooltip: 'Add task',
          child: new Icon(Icons.add)),
    );
  }

  Widget _list() {
    return ListView.builder(
      itemCount: notes.length,
      itemBuilder: (context, position) {
        var element = notes[position];
        return _item(element, position, element.title, element.body);
      },
    );
  }

  Widget _item(Note element, int position, String title, String Body) {
    return Dismissible(
        background: _backgroundSlide(),
        key: UniqueKey(),
        confirmDismiss: (direction) async {
          if (direction == DismissDirection.startToEnd) {
            final bool res = await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: Text(
                        "Are you sure you want to delete ${notes[position].title}?"),
                    actions: <Widget>[
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
                          "Remove",
                          style: TextStyle(color: Colors.red),
                        ),
                        onPressed: () {
                          setState(() {
                            notes.removeAt(position);
                          });
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                });
            return res;
          } else {
            // TODO: Navigate to edit page;
          }
        },
        child: Card(
            color:
                element.completed == 1 ? Colors.blueGrey : Colors.yellow[200],
            child: InkWell(
                onTap: () {
                  print("${notes[position]} clicked");
                },
                child: ListTile(
                  leading: Icon(Icons.add_circle),
                  title: Text(title),
                  subtitle: Text(Body),
                )) // ListTile(title: Text('$element')),
            ));
  }

  Widget _backgroundSlide() {
    return Container(
        color: Colors.red,
        child: Align(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Icon(
                Icons.delete,
                color: Colors.white,
              ),
              Text(
                " Delete",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
          alignment: Alignment.centerRight,
        ));
  }

  void _addNote() async {
    final note = await showDialog<Note>(
      context: context,
      builder: (BuildContext context) {
        return NewNoteDialog();
      },
    );

    if (note != null) {
      setState(() {
        notes.add(note);
      });
    }
  }
}
