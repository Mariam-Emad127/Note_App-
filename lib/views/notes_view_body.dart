import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';
import 'package:notes_app/views/widgets/note_item.dart';

 import '../cubits/notes_cubit/note_cubit.dart';
import 'widgets/note_list_view.dart';


class note_view_body extends StatefulWidget {
  const note_view_body({
    super.key,
  });

  @override
  State<note_view_body> createState() => _note_view_bodyState();
}

class _note_view_bodyState extends State<note_view_body> {
  void initState(){
    BlocProvider.of<NoteCubit>(context).fetchAllNote();
  }
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: 24 ),
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          CustomAppBar(title: 'Note',icon: Icons.search,),
          SizedBox(
            height: 10,
          ),
        //  NoteItem()

          Expanded(child: NoteListView())
        ],
      //)
      ),
    );
  }
}


