import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AddNoteScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notes App'),
      centerTitle: true,
      backgroundColor: Color(0xadee9f87),),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, CupertinoPageRoute(
          fullscreenDialog: true,
            builder: (context)=>AddNoteScreen()));
      },
      child: Icon(Icons.add)),
      body: SafeArea(
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemCount: 7,
            itemBuilder: (context, index){
              return Container(
                margin: EdgeInsets.all(5),
                color: Colors.deepOrange,
              );
            }),
      ),
    );
  }
}
