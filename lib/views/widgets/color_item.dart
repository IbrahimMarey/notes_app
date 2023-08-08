import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({Key? key, required this.isActive, required this.color}) : super(key: key);

  final bool isActive;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isActive?  CircleAvatar(
      radius: 32,
      backgroundColor: color,
      child: const Text('picked',style: TextStyle(color: Colors.white),),
    ):   CircleAvatar(
      radius: 32,
      backgroundColor: color,
    );
  }
}
