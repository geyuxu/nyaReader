import 'package:flutter/material.dart';
import '../widgets/text_display_widget.dart';


class LearnDartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Reader'),
      ),
      body: FutureBuilder<String>(
        future: _getText(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            print('Error: ${snapshot.error}');
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            print('File content: ${snapshot.data}');
            return TextDisplayWidget(content: snapshot.data ?? 'No content');
          } else {
            return TextDisplayWidget(content: snapshot.data ?? 'No content');
          }
        },
      ),
    );
  }

  Future<String> _getText() async {
    //checkPermission();

    return '好好学习，天天向上';
  }

}
