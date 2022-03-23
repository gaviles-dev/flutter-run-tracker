import 'package:f_run_tracker/components/app_button.dart';
import 'package:f_run_tracker/components/app_button_fluid.dart';
import 'package:f_run_tracker/components/app_text_field.dart';
import 'package:f_run_tracker/components/app_text_field_expanded.dart';
import 'package:f_run_tracker/constants/constants.dart';
import 'package:f_run_tracker/constants/text_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDialog {
  const CustomDialog({ Key key });

  customDialogForm({title, c1, c2, c3, onTap}){
    return Get.defaultDialog(
      title: title,
      titleStyle: ConfigTextStyles.header(textcolor: ConfigTheme.primary),
      content: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            FormTextField(
              controller: c1, 
              hintText: ConfigString.dialog_form_title),
            FormExpandedField(
              controller: c2,
              hintText: ConfigString.dialog_form_description,
            ),
            FormTextField(
              controller: c3, 
              hintText: ConfigString.dialog_form_distance,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20,),
            FormButtonFluid(
              onPressed: onTap,
              label: ConfigString.dialog_form_button,
              bgcolor: ConfigTheme.highlight,
              fgcolor: ConfigTheme.primary
            )
          ],
        ),
      )
    );
  }

  customDialogDetails({title, onTap, date, distance, runTitle, desc}){
    return Get.defaultDialog(
     title: '',
      content: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                  // width: double.infinity,
                    child: Text(date, style: ConfigTextStyles.primary(textsize: 20.0),),
                  ),
                  Expanded(child: Container()),
                  Container(
                    child: Icon(Icons.edit, color: ConfigTheme.primary,),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    child: Icon(Icons.delete, color: ConfigTheme.error,),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              child: Text(distance, style: ConfigTextStyles.primary(textsize: 20.0),),
            ),
            SizedBox(height: 20,),
            Container(
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    width: 40,
                    height: 40,
                    child: new CircleAvatar(
                      backgroundColor: ConfigTheme.primary,
                      backgroundImage: AssetImage("assets/run.png"),
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 5),
                          child: Text(runTitle, style: ConfigTextStyles.header(textsize: 16.0),),
                        ),
                        Container(
                          width: 174,
                          child: Text(desc, style: ConfigTextStyles.primary(textsize: 14.0),),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 50,),
            FormButtonFluid(
              onPressed: onTap,
              label: ConfigString.dialog_form_button_close,
              bgcolor: ConfigTheme.highlight,
              fgcolor: ConfigTheme.primary
            ),
            SizedBox(height: 10,),
          ],
        ),
      )
    );
  }

  customDialogConfirmation({title, subtitle, Function onConfirm, Function onCancel}){
    return Get.defaultDialog(
      title: title,
      titleStyle: ConfigTextStyles.header(textcolor: ConfigTheme.primary),
      middleText: subtitle,
      content: Container(
        child: Column(
          children: [
            Container(
              width: 174,
              child: Text(subtitle, textAlign: TextAlign.center, style: ConfigTextStyles.primary(textsize: 20.0),),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  child: FormButtonFluid(
                    onPressed: onCancel,
                    label: ConfigString.dialog_form_button_cancel,
                    bgcolor: ConfigTheme.disableDark,
                    fgcolor: ConfigTheme.textLight
                  ),
                ),
                SizedBox(width: 10,),
                Container(
                  width: 100,
                  child: FormButtonFluid(
                    onPressed: onConfirm,
                    label: ConfigString.dialog_form_button_confirm,
                    bgcolor: ConfigTheme.highlight,
                    fgcolor: ConfigTheme.primary
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}