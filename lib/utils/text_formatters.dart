import 'package:intl/intl.dart';

class ConfigFormatter{

  static String dateWithTime(DateTime date){
    if(date == null){
      return "";
    }

    // sample Display
    // July 2, 2021 12:00 PM
    var f = DateFormat('MMMM d, y hh:mm aaa');
    return f.format(date);
  }
}