import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/note_item.dart';

class NoteListView extends StatelessWidget {
  const NoteListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteCubit,NoteState>(
      builder:(context,state) {
        List<NoteModel>notes=BlocProvider.of<NoteCubit>(context).notes!;
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount:notes.length,
              //state is NoteSuccess ?state.notes.length:0,
              itemBuilder: (context, index) {
                return Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: NoteItem(
                      note:notes[index],
                    ));
              }),
        );


      }
    );
  }
}
