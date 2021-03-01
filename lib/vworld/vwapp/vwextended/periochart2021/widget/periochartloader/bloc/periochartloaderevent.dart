import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';

import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/vwmodel/pcproperties.dart';

abstract class PeriochartLoaderEvent extends Equatable {
  const PeriochartLoaderEvent();

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [];
}

class LoadFromLocalHiveEvent  extends PeriochartLoaderEvent {
  LoadFromLocalHiveEvent({
    @required this.loaderPcPropertiesId,
    @required this.timestamp,
  });

  final String loaderPcPropertiesId;

  final DateTime timestamp;

  @override
  List<Object> get props => [timestamp,loaderPcPropertiesId];

  @override
  String toString() =>
      'LoadFromLocalHiveEvent{${this.timestamp.toString()},${this.loaderPcPropertiesId}}';
}

class SaveToLocalHiveEvent  extends PeriochartLoaderEvent {
  SaveToLocalHiveEvent({
    @required this. pcProperties,
    @required this.timestamp,
  });

  final PcProperties pcProperties;

  final DateTime timestamp;

  @override
  List<Object> get props => [timestamp,pcProperties];

  @override
  String toString() =>
      'LoadFromLocalHiveEvent{${this.timestamp.toString()},${json.encode(pcProperties.toJson())}}';
}