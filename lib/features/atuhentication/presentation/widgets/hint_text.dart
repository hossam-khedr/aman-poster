import 'package:flutter/material.dart';

class HintWidget extends StatelessWidget {
  final String hintText;
  const HintWidget({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Text(
        hintText,
        style:TextStyle(
          color: Colors.grey
        )
      ),
    );
  }
}