import 'package:f_run_tracker/constants/constants.dart';
import 'package:f_run_tracker/constants/text_themes.dart';
import 'package:flutter/material.dart';

class ScreenHeader extends StatelessWidget {
  const ScreenHeader({
    Key key,
    this.label = ConfigString.header,
    this.color = ConfigTheme.textLight
  }) : super(key: key);

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20,),
      child: Text(label, style: ConfigTextStyles.header(textsize: 30.0, textcolor: color),)
    );
  }
}