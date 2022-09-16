import 'package:flutter/material.dart';

class Skelton extends StatelessWidget {
  final double? height, width;
  const Skelton({this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          // borderRadius: BorderRadius.circular(36)
        ));
  }
}
