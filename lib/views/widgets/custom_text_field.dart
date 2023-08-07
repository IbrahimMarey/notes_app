import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.hint,
     this.maxLines=1,
    this.onSaved, this.onChange,
  }) : super(key: key);
  final String hint;
  final int maxLines;
  final void Function(String?)? onSaved;
  final Function(String)? onChange;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved:onSaved ,
      onChanged: onChange,
      validator: (v)
      {
        if(v?.isEmpty ?? true)
        {
          return 'field required';
        }
        return null ;
      },
      cursorColor: kPrimaryColor,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: kPrimaryColor),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(kPrimaryColor)
      ),
    );
  }
  OutlineInputBorder buildBorder([color])
  {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: color ?? Colors.white,
          //width: 2,
        )
    );
  }
}
