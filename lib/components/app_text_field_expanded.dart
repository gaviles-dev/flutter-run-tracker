import 'package:f_run_tracker/constants/constants.dart';
import 'package:f_run_tracker/constants/text_themes.dart';
import 'package:flutter/material.dart';

class FormExpandedField extends StatelessWidget {
  const FormExpandedField({
    Key key,
    @required this.hintText,
    this.controller,
    this.color,
    this.focusNode,
    this.onTap,
  }) : super(key:key);

  final String hintText;
  final TextEditingController controller;
  final Color color ;
  final FocusNode focusNode;
  final VoidCallback onTap;
  
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 10,),
        height: 100.0,
        width: MediaQuery.of(context).size.width -100,
        child: TextFormField(
          maxLines: 5,
          keyboardType: TextInputType.multiline,
          controller: controller,
          decoration: new InputDecoration(
            filled: true,
            fillColor: color != null ? color : Color(0xFFf5f5f5),
            hintText: hintText,
            hintStyle: ConfigTextStyles.primary(textcolor: ConfigTheme.disableDark),
            contentPadding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0, right: 20.0),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide(color: color != null ? color : Color(0xFFf5f5f5))),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide(color: color != null ? color : Color(0xFFf5f5f5))),
          ),
          validator: (value) {
            if (value.isEmpty) {
              return 'Enter some text';
            }
            return null;
          },
          style: TextStyle(
            fontSize: 14
          ),
        ),
      );
  }
}