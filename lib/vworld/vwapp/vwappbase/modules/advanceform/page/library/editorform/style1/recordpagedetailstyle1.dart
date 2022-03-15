import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/page/afformpage/afformpage.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/page/library/editorform/editorform.dart';

class RecordPageDetailStyle1 extends StatelessWidget {
  RecordPageDetailStyle1(
      {required this.afFormPage,
      this.onSaveValidRecordEditorForm,
      this.onSaveInvalidRecordEditorForm});

  AfFormPage afFormPage;

  OnSaveValidRecordEditorForm? onSaveValidRecordEditorForm;
  OnSaveInvalidRecordEditorForm? onSaveInvalidRecordEditorForm;

  @override
  Widget build(BuildContext context) {
    Widget saveButton = IconButton(
      icon: Icon(
        Icons.save,
        color: Colors.white,
      ),
      onPressed: () {
        if (afFormPage.getCurrentState()!.isRecordValid()) {
          if (this.onSaveValidRecordEditorForm != null) {
            this.onSaveValidRecordEditorForm!(
                this.afFormPage.getCurrentState(), context);
          }
        } else {
          if (this.onSaveInvalidRecordEditorForm != null) {
            this.onSaveInvalidRecordEditorForm!(
                this.afFormPage.getCurrentState(), context);
          }
        }
      },
    );

    if (this.afFormPage.isReadOnly == true) {
      saveButton = Container();
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(this.afFormPage.title!),
          actions: [saveButton],
        ),
        body: afFormPage);
  }
}
