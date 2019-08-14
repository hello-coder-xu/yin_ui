import 'package:flutter/material.dart';
//标题
class TitleView extends StatelessWidget {
  final String title;
  final String subTitle;

  TitleView(this.title, this.subTitle);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(32),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(fontSize: 16, color: Colors.black87),
        ),
        subtitle: Text(
          subTitle,
          style: TextStyle(fontSize: 14, color: Colors.black38),
        ),
      ),
    );
  }
}
