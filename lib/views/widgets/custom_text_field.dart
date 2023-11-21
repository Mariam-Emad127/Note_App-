import 'package:flutter/material.dart';
import 'package:notes_app/constant.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.hint,
    this.maxLines = 1, this.onsaved, this.onchangeed,});

  final String hint;
  final int maxLines;
  final void Function (String?)?onsaved;
  final void Function (String?)?onchangeed;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        onSaved:onsaved,
        onChanged: onchangeed,
        validator:(value){
if(value?.isEmpty ?? true){
  return 'Field is required ';
} else {
  return null;
}




        } ,
        cursorColor: kPrimaryColor,
        maxLines: maxLines,
        decoration: InputDecoration(
            hintText: hint,
            helperStyle: TextStyle(color: kPrimaryColor),
            border: buildBorder(),
            enabledBorder: buildBorder(),
            focusedBorder: buildBorder(kPrimaryColor)
        )


    );
  }


  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(

        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.white)

    );
  }

}
