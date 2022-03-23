import 'package:f_run_tracker/constants/constants.dart';
import 'package:f_run_tracker/constants/text_themes.dart';
import 'package:flutter/material.dart';


class FormButtonFluid extends StatelessWidget {
  const FormButtonFluid({ 
    Key key, 
    @required this.onPressed,
    @required this.label,
    this.bgcolor,
    this.fgcolor,
  }) : super(key: key);

  final Function onPressed;
  final String label;
  final Color bgcolor;
  final Color fgcolor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(top: 10),
        height: 40,
        width: MediaQuery.of(context).size.width-100,
        // padding: EdgeInsets.all(20),
        child: Center(child: Text(label, textAlign: TextAlign.center, style: ConfigTextStyles.primary(textcolor: fgcolor, textweight: FontWeight.bold),)),
        decoration: BoxDecoration(
          color: bgcolor,
          borderRadius: BorderRadius.circular(10)
        ),
      ),
    );
  }
}