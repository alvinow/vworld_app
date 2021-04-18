import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InitscreenSplash extends StatelessWidget {
  InitscreenSplash(
      {this.title: 'Memuat',
      this.description: "",
      this.mainAnimation,
      this.widgetUnderDescription});

  final String title;
  final String description;
  final Widget widgetUnderDescription;
  final Widget mainAnimation;

  @override
  Widget build(BuildContext context) {
    Widget activewidgetUnderDescription = Container();

    Widget activeMainAnimation = CircularProgressIndicator(
      strokeWidth: 3,
    );

    if (this.widgetUnderDescription != null) {
      activewidgetUnderDescription = this.widgetUnderDescription;
    }

    if (this.mainAnimation != null) {
      activeMainAnimation = this.mainAnimation;
    }

    return Center(
        child: Container(
            height: 600,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  activeMainAnimation,
                  SizedBox(
                    height: 20,
                    width: 12,
                  ),
                  Center(
                      child: Text(
                    this.title,
                    style: TextStyle(fontSize: 20),
                  )),
                  Center(
                      child: Text(
                    this.description,
                    style: TextStyle(fontSize: 15),
                  )),
                  activewidgetUnderDescription,
                ])));
  }
}
