import 'package:notes_app/model/note.dart';
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
        onPressed: _addNote, tooltip: 'Add task', child: new Icon(Icons.add)
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

  Widget _item(Note element, int position){
    return Text('$position');
  }

  void _addNote(){
    setState(() {
      notes.add(new Note(title: "itemT", body: "itemB", completed: 0 ));
    });
  }
}