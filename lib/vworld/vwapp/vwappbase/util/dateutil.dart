import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:date_format/date_format.dart';

class DateUtil1 {


  static DateTime convertDateFromString(String strDate){
    DateTime returnValue = DateTime.parse(strDate);

    return returnValue;
    //print(todayDate);
    //print(formatDate(todayDate, [yyyy, '/', mm, '/', dd, ' ', hh, ':', nn, ':', ss, ' ', am]));
  }

  static DateFormat getMySQLDateFormat(){
    return DateFormat('yyyy-MM-dd hh:mm:ss');
  }

  static DateFormat get24hDateFormat(){
    return DateFormat('yyyy-MMMM-dd HH:mm');
  }
}