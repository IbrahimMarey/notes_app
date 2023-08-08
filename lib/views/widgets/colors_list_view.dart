import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/color_item.dart';

class ColorsListView extends StatefulWidget {
  const ColorsListView({Key? key}) : super(key: key);

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {

  int currentIndex =0;

  List<Color> colors = [
    Color(0xFF4A4063),
    Color(0xFFBFACC8),
    Color(0xFFC8C6D7),
    Color(0xFF783F8E),
    Color(0xFF4F1271),
  ];
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 32*2,
      child: ListView.builder(
        itemCount: colors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) =>
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: GestureDetector(
              onTap: (){
                currentIndex = index;
                setState(() {

                });
              },
              child: ColorItem(
                isActive: currentIndex== index, color: colors[index],
              ),
            ),
          ),
      ),
    );
  }
}
