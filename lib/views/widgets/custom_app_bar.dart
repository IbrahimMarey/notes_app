import 'package:flutter/cupertino.dart';
import 'package:notes_app/views/widgets/custom_search_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text('Notes',style: TextStyle(
          fontSize: 28,
        ),),
        Spacer(),
        CustomSearchIcon(),
      ],
    );
  }
}
