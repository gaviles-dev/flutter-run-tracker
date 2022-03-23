import 'package:f_run_tracker/constants/constants.dart';
import 'package:f_run_tracker/constants/text_themes.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key key,
    this.label = 'Submit',
    this.bgcolor = ConfigTheme.highlight,
    this.labelcolor = ConfigTheme.textLight,
    this.onTap
  }) : super(key: key);

    final String label;
    final Color labelcolor;
    final Color bgcolor;
    final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width-100,
        padding: EdgeInsets.all(20),
        child: Text(label, textAlign: TextAlign.center, style: ConfigTextStyles.primary(textcolor: labelcolor, textweight: FontWeight.bold),),
        decoration: BoxDecoration(
          color: bgcolor,
          borderRadius: BorderRadius.circular(15)
        ),
      ),
    );
  }
}