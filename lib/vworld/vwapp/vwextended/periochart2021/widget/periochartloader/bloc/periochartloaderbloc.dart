import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/vwmodel/pcproperties.dart';
import 'dart:convert';
import 'periochartloaderstate.dart';
import 'periochartloaderevent.dart';
import 'package:bloc/bloc.dart';
import 'dart:async';
import 'package:rxdart/rxdart.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class PeriochartLoaderBloc
    extends Bloc<PeriochartLoaderEvent, PeriochartLoaderState> {
  @override
  get initialState => PeriochartLoaderStateUninitialized();

  @override
  Stream<Transition<PeriochartLoaderEvent, PeriochartLoaderState>>
      transformEvents(
          Stream<PeriochartLoaderEvent> events,
          TransitionFunction<PeriochartLoaderEvent, PeriochartLoaderState>
              transitionFn) {
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 300)),
      transitionFn,
    );
  }

  @override
  Stream<PeriochartLoaderState> mapEventToState(
      PeriochartLoaderEvent event) async* {
    PeriochartLoaderState currentState = state;

    if(event is LoadFromLocalHiveEvent)
      {
        yield PeriochartLoaderStateProcessing(title: 'Loading', description: 'Loading Records... ${event.loaderPcPropertiesId}');

        var box = await Hive.openBox('PcProperties');

        PcProperties loadedPcProperties= await box.get(event.loaderPcPropertiesId);

        await box.close();

        await Future.delayed(const Duration(seconds: 1), () {});

        yield PeriochartLoaderStateShowChart(loaderPcPropertiesId: event.loaderPcPropertiesId, pcProperties: loadedPcProperties);
        return;

      }
    else if(event is SaveToLocalHiveEvent){
      yield PeriochartLoaderStateProcessing(title: 'Loading', description: 'Saving Records... ${event.pcProperties.id}');

      var box = await Hive.openBox('PcProperties');

      await box.put(event.pcProperties.id, event.pcProperties);

      await box.close();

      await Future.delayed(const Duration(seconds: 1), () {});

      yield PeriochartLoaderStateShowChart(loaderPcPropertiesId: event.pcProperties.id, pcProperties: event.pcProperties);
      return;

    }


  }
}
