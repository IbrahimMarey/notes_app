import 'package:flutter/material.dart';

class CustomSearchIcon extends StatelessWidget {
  const CustomSearchIcon({Key? key,required this.iconData}) : super(key: key);

  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Center(
        child: Icon(
          iconData,
          size: 28,
        ),
      ),
    );
  }
}
