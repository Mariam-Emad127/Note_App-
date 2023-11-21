import 'package:flutter/material.dart';

import '../../constant.dart';



class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onTap, this.isLoading = false});

  final void Function()? onTap;
  //
   final bool isLoading;
  @override
  Widget build(BuildContext context) {
     return
       GestureDetector(
     onTap: onTap,
     child:
    Container(
        width: MediaQuery.of(context).size.width,
        height: 55,
        decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(
              8,
            )),

    child: Center(
      child:isLoading ? CircularProgressIndicator(): Text(
              'Add',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
    ),
        // ),
      ),
    );
  }
}