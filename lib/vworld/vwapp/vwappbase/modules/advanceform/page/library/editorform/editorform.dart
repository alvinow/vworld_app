export 'style1/style1.dart';

import 'package:flutter/cupertino.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/model/afform.dart';

typedef OnSaveValidRecordEditorForm = void Function(
    AfForm?, BuildContext);
typedef OnSaveInvalidRecordEditorForm  = void Function(
    AfForm?, BuildContext);