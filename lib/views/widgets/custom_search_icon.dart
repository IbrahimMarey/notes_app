import 'package:flutter/material.dart';

class CustomSearchIcon extends StatelessWidget {
  const CustomSearchIcon({Key? key,required this.iconData, this.onPressed}) : super(key: key);

  final void Function()? onPressed;
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
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            iconData,
            size: 28,
          ),
        ),
      ),
    );
  }
}
