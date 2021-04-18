import 'package:flutter/cupertino.dart';
import 'package:date_format/date_format.dart';

class DateUtil1 {


  static DateTime convertDateFromString(String strDate){
    DateTime returnValue = DateTime.parse(strDate);

    return returnValue;
    //print(todayDate);
    //print(formatDate(todayDate, [yyyy, '/', mm, '/', dd, ' ', hh, ':', nn, ':', ss, ' ', am]));
  }
}