import 'package:flutter/cupertino.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/page/afformgrid/afformgridparam.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/page/afformgrid/afformgridrow.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/page/library/bottomloader.dart';

class AfFormGrid extends StatefulWidget {
  AfFormGrid(this.afFormGridParam);
  AfFormGridParam afFormGridParam;
  _AfFormGridState createState() => _AfFormGridState();
}

class _AfFormGridState extends State<AfFormGrid> {
  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      /*
      if (this.widget.documentScrollGridParam.loadScrollGrid != null) {
        print("Scroll Load Row");
        this.widget.documentScrollGridParam.loadScrollGrid();
      }*/
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget returnValue = Container();

    if (this.widget.afFormGridParam.records.length > 0) {
      returnValue = ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return index >= this.widget.afFormGridParam.records.length
              ? BottomLoader()
              : AfFormGridRow(
                  this.widget.afFormGridParam.records.elementAt(index), this.widget.afFormGridParam);
        },
        itemCount: this.widget.afFormGridParam.hasReachedMax
            ? this.widget.afFormGridParam.records.length
            : this.widget.afFormGridParam.records.length + 1,
        controller: _scrollController,
      );
    } else {
      returnValue = Center(child: Text('Empty Grid'));
    }

    return returnValue;
  }
}
