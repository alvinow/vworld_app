import 'package:flutter/material.dart';

import 'package:vworld_app/vworld/vwapp/vwappbase/modules/layauth/main.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/vwextendable/vwhomebase/vwhomebase.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/vwaaa/vwaccounting/vwaccounting.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/vwaaa/vwauthentication/vwauthentication.dart';

import 'package:vworld_app/vworld/vwcore/vwauthorization/vwauthorization.dart';

class VwHomeBasePeriochart2021 extends VwHomeBase {
  VwHomeBasePeriochart2021(VwAuthentication vwAuthentication,
      VwAuthorization vwAuthorization, VwAccounting vwAccounting)
      : super(vwAuthentication, vwAuthorization, vwAccounting);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home:LayAuth());

  }
}
