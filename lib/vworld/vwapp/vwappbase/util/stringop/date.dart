import 'package:intl/intl.dart';

class DateUtil{




  static String indonesiaDateFormat='dd MMM yyyy';

  static String convertMySqlDateToFlutterDate(String strDate){

    String returnValue='';
    try {
      String flutterStringDate = strDate.replaceAll('-', '');

      DateTime currentDate = DateTime.parse(flutterStringDate);
      print(currentDate);

      returnValue = DateFormat(DateUtil.indonesiaDateFormat).format(
          currentDate);
    }
    catch(error)
    {

    }

    return returnValue;
  }


}