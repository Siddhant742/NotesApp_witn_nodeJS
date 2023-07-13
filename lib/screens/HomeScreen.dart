import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/controller/NoteProvider.dart';
import 'package:provider/provider.dart';
import '../models/Note.dart';
import 'AddNoteScreen.dart';

class HomeScreen extends StatelessWidget {
  NotesProvider noteProvider = NotesProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes App'),
        centerTitle: true,
        backgroundColor: Color(0xadee9f87),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                CupertinoPageRoute(
                    fullscreenDialog: true,
                    builder: (context) => AddNoteScreen(
                          isUpdate: false,
                        )));
          },
          child: Icon(Icons.add)),
      body: SafeArea(
        child: context.watch<NotesProvider>().notes.length < 1
            ? Center(
                child: Text('No Notes Found!'),
              )
            : GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: context.watch<NotesProvider>().notes.length,
                itemBuilder: (context, index) {
                  Note currentNote =
                      context.watch<NotesProvider>().notes[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => AddNoteScreen(
                                  isUpdate: true, note: currentNote)));
                    },
                    onLongPress: () {
                      context.read<NotesProvider>().deleteNote(currentNote);
                    },
                    child: Container(
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Color(0x6ee9f87),
                          borderRadius: BorderRadius.circular(24),
                          border:
                              Border.all(color: Color(0xadee9f87), width: 2)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            currentNote.title!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            currentNote.content!,
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey[700]),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
      ),
    );
  }
}
