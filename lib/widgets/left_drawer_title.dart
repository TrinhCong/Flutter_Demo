import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/sizes.dart';


class LeftDrawerTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onTap;
  final Color iconColor;

  LeftDrawerTile({@required this.text, @required this.icon, this.iconColor, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      title: Text(
        text.toUpperCase(),
        style: TextStyle(
          color: Color(0xFFF7F7F7),
          fontWeight: FontWeight.normal,
          fontSize: ArchMediaSizes.getFontSize(14.0),
          fontFamily: 'Roboto-Condensed',
        ),
      ),
      onTap: onTap,
    );
  }
}
