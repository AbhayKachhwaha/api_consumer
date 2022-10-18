import 'package:flutter/material.dart';

class ArticleWidget extends StatelessWidget {
  const ArticleWidget({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(child: Text(text));
  }
}
