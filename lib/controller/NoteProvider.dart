import 'package:flutter/cupertino.dart';
import 'package:notes_app/services/ApiService.dart';
import '../models/Note.dart';

class NotesProvider with ChangeNotifier{
  NotesProvider(){
    fetchNote();
  }
  List<Note> notes =[];
  sortNotes(){
    notes.sort((a,b) => b.dateadded!.compareTo(a.dateadded!)) ;
  }
  addNote(Note note){
    notes.add(note);
    sortNotes();
    notifyListeners();
    ApiService.addNote(note);
  }
  updateNote(Note note){
    int indexofNote = notes.indexWhere((element) => element.id == note.id);
    print('Index of Note:'+ indexofNote.toString());
    notes[indexofNote]= note;
    sortNotes();
    notifyListeners();
    ApiService.addNote(note);
  }
  deleteNote(Note note){
    int indexofNote = notes.indexWhere((element) => element.id == note.id );
    notes.removeAt(indexofNote as int);
    sortNotes();
    notifyListeners();
    ApiService.deleteNote(note);
  }
  fetchNote() async{
    notes = await ApiService.fetchNote('siddhantThakur');
    sortNotes();
    notifyListeners();
  }
  List<Note>filteredNote(String searchQuery){
    List<Note> filterednotes = notes.where((element) => element.title!.toLowerCase().contains(searchQuery.toLowerCase()) || element.content!.toLowerCase().contains(searchQuery.toLowerCase())).toList();
    return filterednotes;
  }
}