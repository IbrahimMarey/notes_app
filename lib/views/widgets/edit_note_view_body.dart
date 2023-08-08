import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/colors_list_view.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';
import 'package:notes_app/views/widgets/edit_note_color_list.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({Key? key, required this.note}) : super(key: key);

  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody>
{
  String? title,content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          const SizedBox(height: 50,),
          CustomAppBar(
            onPressed: (){
              widget.note.title=title ??widget.note.title;
              widget.note.subTitle=content ??widget.note.subTitle;
              widget.note.save();
              Navigator.pop(context);
            },
            title: 'Edit',
            iconData: Icons.check,
          ),
          const SizedBox(height: 50,),

          CustomTextField(
              hint: widget.note.title,
            onChange: (v){
                title=v;
            },
          ),
          const SizedBox(height: 16,),
          CustomTextField(hint: widget.note.subTitle,maxLines: 5,
            onChange: (v){
            content =v;
            },
          ),
          const SizedBox(height: 16,),
           EditNoteColorList(noteModel: widget.note,),
        ],
      ),
    );
  }
}
