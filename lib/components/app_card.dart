import 'package:f_run_tracker/constants/constants.dart';
import 'package:f_run_tracker/constants/text_themes.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({ 
    Key key,
    this.title,
    this.desc,
    this.date,
    this.distance,
    this.onTapEdit,
    this.onTapDelete,
    this.onTapCard
  }) : super(key: key);

  final String title;
  final String desc;
  final String date;
  final String distance;
  final Function onTapEdit;
  final Function onTapDelete;
  final Function onTapCard;
  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapCard,
      child: Container(
        margin: EdgeInsets.fromLTRB(35, 5, 20, 5),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: ConfigTheme.disableDark,
            width: 0.5
          )
        ),
        child: Column(
          children: [
            Container(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      child: Text(date, style: ConfigTextStyles.primary(textsize: 12.0),),
                    ),
                    Expanded(child: Container()),
                    GestureDetector(
                      onTap: onTapEdit,
                      child: Container(
                        child: Icon(Icons.edit, color: ConfigTheme.primary,),
                      ),
                    ),
                    SizedBox(width: 10,),
                    GestureDetector(
                      onTap: onTapDelete,
                      child: Container(
                        child: Icon(Icons.delete, color: ConfigTheme.error,),
                      ),
                    ),
                  ],
                ),
              ),
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
                          child: Text(title, style: ConfigTextStyles.header(textsize: 16.0),),
                        ),
                        Container(
                          width: 230,
                          child: Text(desc, maxLines: 1, overflow: TextOverflow.ellipsis, style: ConfigTextStyles.primary(textsize: 16.0),),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          width: 174,
                          child: Text(distance, style: ConfigTextStyles.primary(textsize: 16.0),),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}