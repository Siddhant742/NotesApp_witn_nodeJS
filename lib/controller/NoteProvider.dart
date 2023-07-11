import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../models/Note.dart';

class NoteProvider with ChangeNotifier{
  List<Note> notes =[];
  addNote(Note note){
    notes.add(note);
  }
}