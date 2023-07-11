import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({Key? key}) : super(key: key);

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  FocusNode noteFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Note'),
      actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.check))
      ],),
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              autofocus: true,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
              ),
              decoration: InputDecoration(
                hintText: 'Title',
                border: InputBorder.none
              ),
              onSubmitted: (val){
                if(val != null){
                  noteFocus.requestFocus();
                }
              },
            ),
            TextField(
              focusNode: noteFocus,
              style: TextStyle(
                fontSize: 20,
              ),
              decoration: InputDecoration(
                hintText: 'Note',
                border: InputBorder.none
              ),
            )
          ],
        ),
      ),
    );
  }
}
