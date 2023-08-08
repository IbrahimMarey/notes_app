import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/color_item.dart';

class ColorsListView extends StatelessWidget {
  const ColorsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) =>
        ColorItem(),
    );
  }
}
