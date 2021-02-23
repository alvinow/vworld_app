import 'package:flutter/material.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/widget/periochart/main.dart';

typedef IndexChangedCyclicIconButton = void Function(String, int);

class CyclicIconButton extends StatefulWidget {
  CyclicIconButton(
      {@required this.fieldName,
      this.initialIndex: 0,
      @required this.iconDataList,
      this.iconSize: 15.0,
      @required this.colorList,
      this.pcCallbackIntegerField,
      this.isReadOnly: true,
      this.backgroundColor: Colors.white});

  final Color backgroundColor;
  final String fieldName;
  final bool isReadOnly;
  final PcCallbackIntegerField pcCallbackIntegerField;
  final List<IconData> iconDataList;
  final List<Color> colorList;
  final double iconSize;
  final initialIndex;

  _CyclicIconButtonState createState() => _CyclicIconButtonState();
}

class _CyclicIconButtonState extends State<CyclicIconButton> {
  int currentIndex;
  DateTime lastTap;

  @override
  void initState() {
    super.initState();

    this.lastTap = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    this.currentIndex = this.widget.initialIndex;
    return Container(
        color: this.widget.backgroundColor,
        width: this.widget.iconSize,
        height: this.widget.iconSize,
        padding: const EdgeInsets.all(0.0),
        child: IconButton(
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
            alignment: Alignment.center,
            iconSize: this.widget.iconSize,
            focusColor: Colors.orange,
            onPressed: () async {
              if (this.widget.isReadOnly == false) {
                DateTime now = DateTime.now();
                Duration difference = now.difference(this.lastTap);

                int diffInMs = difference.inMilliseconds;



                if (diffInMs > 200) {


                  await this.nextCircularIndex();
                }
              }
            },
            color: this.getActiveColor(),
            icon: Icon(this.getActiveIconData())));
  }

  Color getActiveColor() {
    Color returnValue = this.widget.colorList.elementAt(this.currentIndex);
    return returnValue;
  }

  IconData getActiveIconData() {
    return this.widget.iconDataList.elementAt(this.currentIndex);
  }

  Future<void> nextCircularIndex() async {
    if (this.currentIndex + 1 < this.widget.iconDataList.length) {
      this.currentIndex = this.currentIndex + 1;
    } else {
      this.currentIndex = 0;
    }

    if (this.widget.pcCallbackIntegerField != null) {
      this
          .widget
          .pcCallbackIntegerField(this.widget.fieldName, this.currentIndex);
    }

    //setState(() {});
  }
}
