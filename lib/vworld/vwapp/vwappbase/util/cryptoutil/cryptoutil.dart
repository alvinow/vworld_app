import 'package:crypto/crypto.dart';
import 'dart:convert';


class CryptoUtil{
  static String getMd5(String inputString)
  {
    return md5.convert(utf8.encode(inputString)).toString();
  }
}