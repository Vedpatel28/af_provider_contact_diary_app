import 'package:flutter/material.dart';

class mybackbutton extends StatelessWidget {
  const mybackbutton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: const Icon(
        Icons.navigate_before_rounded,
        size: 35,
      ),
    );
  }
}
