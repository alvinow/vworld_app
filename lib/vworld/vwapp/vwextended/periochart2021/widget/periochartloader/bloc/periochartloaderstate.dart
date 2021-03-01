import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';

import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/vwmodel/pcproperties.dart';

abstract class PeriochartLoaderState extends Equatable {
  const PeriochartLoaderState();

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [];

}

class PeriochartLoaderStateUninitialized extends PeriochartLoaderState {
  @override
  String toString() => 'PeriochartLoaderStateUninitialized';
}

class PeriochartLoaderStateProcessing extends PeriochartLoaderState {
PeriochartLoaderStateProcessing({@required this.title,@required this.description});

final String title;
final String description;

@override
List<Object> get props => [title,description];

@override
String toString() =>
'PeriochartLoaderStateProcessing{title:${title},description:${description}}';
}

class PeriochartLoaderStateShowChart extends PeriochartLoaderState{

  PeriochartLoaderStateShowChart({@required this.loaderPcPropertiesId, @required this.pcProperties});

  final String loaderPcPropertiesId;
  final PcProperties pcProperties;

  @override
  String toString() =>
      'PeriochartLoaderStateShowChart{title:${this.loaderPcPropertiesId},description:${json.encode(pcProperties.toJson())}}';


}