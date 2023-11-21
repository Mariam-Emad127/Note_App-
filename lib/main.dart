import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/constant.dart';
import 'package:notes_app/cubits/notes_cubit/note_cubit.dart';
 import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/simple_bloc_observer.dart';
import 'package:notes_app/views/note_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  Bloc.observer=SimpleBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());

 await Hive.openBox<NoteModel>(kNotesBox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>NoteCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(brightness: Brightness.dark,fontFamily: "Poppins"),
        home: NotesView(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}


