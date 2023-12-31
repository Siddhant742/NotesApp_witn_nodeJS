import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:notes_app/models/Note.dart';

class ApiService {
  static String _baseUrl = 'https://node-express-server-e51y.onrender.com/Notes';
  static Future<void>  addNote(Note note) async {
    Uri requestUri = Uri.parse(_baseUrl+'/add');
    var response = await http.post(requestUri, body: note.toMap() );
    var decoded = jsonDecode(response.body);
    print(decoded);
  }
  static Future<void>  deleteNote(Note note) async {
    Uri requestUri = Uri.parse(_baseUrl+'/delete');
    var response = await http.post(requestUri, body: note.toMap() );
    var decoded = jsonDecode(response.body);
    print(decoded);
  }
  static Future<List<Note>> fetchNote(String userid)async {
    Uri requestUri = Uri.parse(_baseUrl+ '/list');
    var response = await http.post(requestUri, body: { 'userid': userid });
    var decoded = jsonDecode(response.body);
    print(decoded);
    List<Note> notes = [];

    for( var noteMap in decoded){
      var newNote = Note.fromMap(noteMap);
      notes.add(newNote);
    }
    return notes;
  }
}