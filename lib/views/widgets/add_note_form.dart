import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/colors_list_view.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';
import '../../cubits/add_note cubit_/add_note_cubit.dart';
import '../../cubits/notes_cubit/note_cubit.dart';
import 'custom_button.dart';
import 'package:intl/intl.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
         const SizedBox(
            height: 32,
          ),
          CustomTextField(
            hint: "Title",
            onsaved: (value) {
              title = value;
            },
          ),
          SizedBox(
            height: 16,
          ),
          CustomTextField(
            hint: "Content",
            maxLines: 5,
            onsaved: (value) {
              subTitle = value;
            },
          ),
          ColorsListView(),
          SizedBox(
            height: 32,
          ),
          BlocBuilder<AddNoteCubit, AddNoteState>(builder: (context, state) {
            return CustomButton(
              isLoading: state is AddNoteLoadind ? true : false,
              onTap: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  var currentDate = DateTime.now();

                  var formattedCurrentDate =DateFormat('dd-mm-yyyy').format(currentDate);
                var noteModel = NoteModel(
                    title: title!,
                    subTitle: subTitle!,
                    date: formattedCurrentDate,
                    color: Colors.blue.value);
                BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
              }else{
                  autovalidateMode =AutovalidateMode.always;
                  setState(() {});
                }
                }

            );
          }),
          SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
