import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VwDialog {
  static void showAlertDialog(BuildContext context,
      {String title: 'Alert Dialog',
      String content: '',
      String buttonCaption: 'OK'}) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text(buttonCaption),
      onPressed: () {
        Navigator.of(context).pop(); //popping the dialog
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
