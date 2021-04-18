import 'package:flutter/material.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/model/userlogin.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/vwextendable/vwhomebase/vwhomebaseperiochart2021.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/vwmodel/pcpatient.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/vwmodel/pcproperties.dart';

import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/vwmodel/pcsingleteethproperties.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/vwmodel/pcsingleteethsideproperties.dart';


Future<void> main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(PcPropertiesAdapter());
  Hive.registerAdapter(PcSingleTeethPropertiesAdapter());
  Hive.registerAdapter(PcSingleTeethSidePropertiesAdapter());
  Hive.registerAdapter(PcPatientAdapter());
  Hive.registerAdapter(UserloginAdapter());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return VwHomeBasePeriochart2021(null, null, null);
  }
}
