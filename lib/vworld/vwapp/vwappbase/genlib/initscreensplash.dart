import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InitscreenSplash extends StatelessWidget {
  InitscreenSplash({@required this.title: 'Memuat', this.description: "", this.mainAnimation, this.widgetUnderDescription});

  final String title;
  final String description;
  Widget widgetUnderDescription;
  Widget mainAnimation;


  @override
  Widget build(BuildContext context) {

    if(this.widgetUnderDescription==null)
    {
      this.widgetUnderDescription=Container();
    }

    if(this.mainAnimation==null){
      this.mainAnimation=CircularProgressIndicator(
        strokeWidth: 3,
      );
    }


    return Scaffold(
        body: Container(
            height: 600,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  this.mainAnimation,
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
                  widgetUnderDescription,
                ])));
  }
}