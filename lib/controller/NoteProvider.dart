import 'package:flutter/cupertino.dart';

import '../models/Note.dart';

class NotesProvider with ChangeNotifier{
  List<Note> notes =[];
  addNote(Note note){
    notes.add(note);
    notifyListeners();
  }
  updateNote(Note note){
    int indexofNote = notes.firstWhere((element) => element.id == note.id) as int;
    notes[indexofNote]= note;
    notifyListeners();
  }
  deleteNote(Note note){
    var indexofNote = notes.firstWhere((element) => element.id == note.id );
    notes.removeAt(indexofNote as int);
    notifyListeners();
  }
}