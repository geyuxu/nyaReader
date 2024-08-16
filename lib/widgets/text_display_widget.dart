import 'package:flutter/material.dart';

class TextDisplayWidget extends StatelessWidget {
  final String content;

  TextDisplayWidget({required this.content});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Text(
        content,
        style: TextStyle(fontSize: 16.0),
      ),
    );
  }
}