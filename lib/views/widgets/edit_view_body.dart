import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/note_cubit.dart';
import 'package:notes_app/views/widgets/colors_list_view.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';

import '../../models/note_model.dart';
import 'edit_note_colors_list_view.dart';

class EditViewBody extends StatefulWidget {
  const EditViewBody({super.key, required this.note, });
  final NoteModel note;


  @override
  State<EditViewBody> createState() => _EditViewBodyState();
}

class _EditViewBodyState extends State<EditViewBody> {
  String? title,content;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(children: [
          SizedBox(
            height: 50,
          ),
          CustomAppBar(
           onPressed: (){
             widget.note.title=title ?? widget.note.title;
           widget.note.subTitle=content ??widget.note.subTitle;
           widget.note.save();
           BlocProvider.of<NoteCubit>(context).fetchAllNote();
           Navigator.pop(context);
           },
            title: 'Edit Note',
            icon: Icons.check,
          ),
          SizedBox(
            height: 50,
          ),
          CustomTextField(
            onchangeed: (value){
              title=value;
            },
            hint:  widget.note.title,
          ),
          SizedBox(
            height: 16,
          ),
          CustomTextField(
            onchangeed: (value){
              content=value;
            },
            hint: widget.note.subTitle,
            maxLines: 5,
          ),
          EditNoteColorsList(note: widget.note,)

        ]));
  }
}
