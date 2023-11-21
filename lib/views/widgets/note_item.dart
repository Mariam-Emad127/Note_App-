import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return EditNoteView(note: note,);
        }));
      },
      child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
              color: Color(note.color),
              borderRadius: BorderRadius.circular(16)),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
            ListTile(
              title: Text(
                note.title,
                style: TextStyle(color: Colors.black, fontSize: 26),
              ),
              subtitle: Padding(
                padding: EdgeInsets.only(top: 16, bottom: 16),
                child: Text(note.subTitle,
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontSize: 20)),
              ),
              trailing: IconButton(
                  onPressed: () {
                    note.delete();
                    BlocProvider.of<NoteCubit>(context).fetchAllNote();
                    },
                  icon: Icon(Icons.delete),
                  color: Colors.black),
            ),
            Padding(
                padding: EdgeInsets.only(right: 16),
                child: Text(note.date,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16)))
          ])),
    );
  }
}
