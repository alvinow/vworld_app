import 'package:flutter/cupertino.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/vwaaa/vwaccounting/vwaccounting.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/vwaaa/vwauthentication/vwauthentication.dart';
import 'package:vworld_app/vworld/vwcore/vwauthorization/vwauthorization.dart';

abstract class VwHomeBase extends StatelessWidget {
  VwHomeBase(this.vwAuthentication, this.vwAuthorization, this.vwAccounting);

  final VwAuthorization? vwAuthorization;
  final VwAuthentication? vwAuthentication;
  final VwAccounting? vwAccounting;
}
