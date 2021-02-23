import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {

  final String title;
  final Widget bottom;
  final Size preferredSize = Size.fromHeight(100);

  CustomAppBar({
    Key key,
    this.title,
    this.bottom
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: false,
      title: Text(title),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(20),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: bottom,
        )
      ),
    );
  }
}