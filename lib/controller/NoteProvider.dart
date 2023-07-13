import 'package:flutter/cupertino.dart';
import 'package:notes_app/services/ApiService.dart';

import '../models/Note.dart';

class NotesProvider with ChangeNotifier{
  List<Note> notes =[];
  addNote(Note note){
    notes.add(note);
    notifyListeners();
    ApiService.addNote(note);
  }
  updateNote(Note note){
    int indexofNote = notes.indexWhere((element) => element.id == note.id);
    print('Index of Note:'+ indexofNote.toString());
    notes[indexofNote]= note;
    notifyListeners();
    ApiService.addNote(note);
  }
  deleteNote(Note note){
    int indexofNote = notes.indexWhere((element) => element.id == note.id );
    notes.removeAt(indexofNote as int);
    notifyListeners();
    ApiService.deleteNote(note);
  }
}