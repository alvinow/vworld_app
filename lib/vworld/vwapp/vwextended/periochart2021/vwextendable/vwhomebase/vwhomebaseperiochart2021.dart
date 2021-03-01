import 'package:flutter/material.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/vwextendable/vwhomebase/vwhomebase.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/vwaaa/vwaccounting/vwaccounting.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/vwaaa/vwauthentication/vwauthentication.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/widget/periochart/main.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/widget/periochartloader/periochartloader.dart';
import 'package:vworld_app/vworld/vwcore/vwauthorization/vwauthorization.dart';

class VwHomeBasePeriochart2021 extends VwHomeBase {
  VwHomeBasePeriochart2021(VwAuthentication vwAuthentication,
      VwAuthorization vwAuthorization, VwAccounting vwAccounting)
      : super(vwAuthentication, vwAuthorization, vwAccounting);

  @override
  Widget build(BuildContext context) {






    return MaterialApp(
      color: Colors.grey,

      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: SafeArea(

          child: InteractiveViewer(

            boundaryMargin: const EdgeInsets.fromLTRB(50, 50, 50, 50),
            constrained: false,
            scaleEnabled: true,

            panEnabled: true, // Set it to false to prevent panning.

            minScale: 0.1,
            maxScale: 2,

            child: PeriochartLoader(),
          ),
        ),
      ),
    );
  }
}
