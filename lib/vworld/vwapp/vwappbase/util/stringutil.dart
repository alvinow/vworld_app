import 'dart:ffi';

import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
//import 'package:flutter_money_formatter/flutter_money_formatter.dart';

class StringUtil {
  static isNonZeroLengthString(String value) {
    return value != null && value.length > 0;
  }

  static String convertDoubleToStringCurrencyWithLocaleFormat(
      double value, String locale) {
    String returnValue;
    final currencyFormatter = NumberFormat.currency(locale: locale);
    print(currencyFormatter.format(value));
    return returnValue;
  }

  /*
  static FlutterMoneyFormatter  getFlutterMonetFormatterRupiah(double amount){
    FlutterMoneyFormatter fmf = new FlutterMoneyFormatter(
        amount: amount,
        settings: MoneyFormatterSettings(
            symbol: 'Rp',
            thousandSeparator: '.',
            decimalSeparator: ',',
            symbolAndNumberSeparator: '',
            fractionDigits: 0,
            compactFormatType: CompactFormatType.short));

    return fmf;
  }*/

  static String toMySqlFormat(DateTime dateTime) {
    var formatter = new DateFormat('yyyy-MM-dd HH:mm:ss');
    String returnValue = formatter.format(dateTime);
    return returnValue;
  }

  static String getUniqueFileName() {
    return "file${StringUtil.toFileNameFormat(DateTime.now())}_${Uuid().v4()}";
  }

  static String toFileNameFormat(DateTime dateTime) {
    var formatter = new DateFormat('yyyyMMdd_HHmmss');
    String returnValue = formatter.format(dateTime) + '_timestamp';
    return returnValue;
  }
}
