import 'package:notes_app/model/note.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

   TextEditingController _textFieldController = TextEditingController();
  //List<Note> notes = new List<Note>();
  List<String> notes = List<String>.generate(20, (i) => "Item ${i + 1}");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes App"),
      ),
      body: _list(),
      floatingActionButton: new FloatingActionButton(
        onPressed: onPressed: () => _displayDialog(context), tooltip: 'Add task', child: new Icon(Icons.add)
      ),
    );
  }

  Widget _list(){
    return ListView.builder(
      itemCount: notes.length,
      itemBuilder: (context, position) {
        var element = notes[position];
        return _item(element, position);
      },
    );
  }

  Widget _item(String element, int position){
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
                      "Are you sure you want to delete ${notes[position]}?"),
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
                        "Delete",
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
      
      child: InkWell(
          onTap: () {
            print("${notes[position]} clicked");
          },
          child: ListTile(title: Text('${notes[position]}'))
        ) // ListTile(title: Text('$element')),
    );
  }

  Widget _backgroundSlide(){
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
      )
    );
  }

  void _addNote(){
    setState(() {
      //notes.add(new Note(title: "itemT", body: "itemB", completed: 0 ));
    });
  }


  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('New Note'),
            content: TextField(
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "Tittle"),
            ),TextField(
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "Body"),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
               new FlatButton(
                child: new Text('DONE'),
                onPressed: () {
                  _addNote;
                },
              )
            ],
          );
        });
  }
}