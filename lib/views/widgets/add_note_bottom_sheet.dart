import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_app/cubits/add_note%20cubit_/add_note_cubit.dart';
import 'package:notes_app/cubits/notes_cubit/note_cubit.dart';

 // import '../../cubits/notes_cubit/note_cubit.dart';
import 'add_note_form.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>AddNoteCubit(),

        child: BlocConsumer<AddNoteCubit, AddNoteState>(
          listener: (BuildContext context, Object? state) {
            if (state is AddNoteFailiar) {
              print("Faild${state.errMessage}");
            }

            if (state is AddNoteSuccess) {
               BlocProvider.of<NoteCubit>(context).fetchAllNote();
              Navigator.pop(context);
            }
          },

          builder:(context,state) {
            return AbsorbPointer(
              absorbing:state is AddNoteLoadind ?true :false ,
            child: Padding(padding: EdgeInsets.only(left: 16,right: 16,bottom: MediaQuery.of(context).viewInsets.bottom) ,
         child: SingleChildScrollView(child: AddNoteForm()
         )
            )
            );
          }
    )


        );
      //),
    //)
  }
}
