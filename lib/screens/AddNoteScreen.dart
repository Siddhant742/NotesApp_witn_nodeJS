import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/models/Note.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../controller/NoteProvider.dart';

class AddNoteScreen extends StatefulWidget {
  late bool isUpdate;
  final Note? note;
  AddNoteScreen({required this.isUpdate, this.note});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  FocusNode noteFocus = FocusNode();
  NotesProvider noteProvider = NotesProvider();
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  addNewNote() {
    Note newNote =Note (
        id: Uuid().v1(),
        userid: "siddhantThakur",
        title: titleController.text,
        content: contentController.text,
        dateadded: DateTime.now());
    Provider.of<NotesProvider>(context, listen: false).addNote(newNote);
    Navigator.pop(context);
  }
  updateNote(){
    widget.note!.title = titleController.text;
    widget.note!.content = contentController.text;
    widget.note!.dateadded = DateTime.now();
   Provider.of<NotesProvider>(context, listen: false).updateNote(widget.note!);
   Navigator.pop(context);
  }
  @override
  void initState() {
    if( widget.isUpdate) {
      titleController.text = widget.note!.title!;
      contentController.text = widget.note!.content!;
      super.initState();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Note'),
        actions: [IconButton(onPressed: () {
          if(widget.isUpdate == true) {
            updateNote();
          }
          else{
            addNewNote();
          }
        }, icon: Icon(Icons.check))],
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(vertical:2 , horizontal: 12),
          child: Column(
            children: [
              TextField(
                controller: titleController,
                autofocus: widget.isUpdate == false ? true:false,
                maxLines: 1,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
                decoration:
                    InputDecoration(hintText: 'Title', border: InputBorder.none),
                onSubmitted: (val) {
                  if (val != null) {
                    noteFocus.requestFocus();
                  }
                },
              ),
              TextField(
                controller: contentController,
                focusNode: noteFocus,
                maxLines: null,
                style: TextStyle(
                  fontSize: 20,
                ),
                decoration:
                    InputDecoration(hintText: 'Note', border: InputBorder.none),
                // onChanged: (val){
                //   contentController.text = val;
                // },
              )
            ],
          ),
        ),
      ),
    );
  }
}
