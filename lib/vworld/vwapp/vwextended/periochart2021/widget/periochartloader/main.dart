import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/genlib/genlib.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/widget/periochart/main.dart';
import 'bloc/bloc.dart';

class PeriochartLoader extends StatefulWidget {
  _PeriochartLoaderState createState() => _PeriochartLoaderState();
}

class _PeriochartLoaderState extends State<PeriochartLoader> {
  late PeriochartLoaderBloc bloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) {
      this.bloc = PeriochartLoaderBloc();

      return this.bloc;
    }, child: BlocBuilder<PeriochartLoaderBloc, PeriochartLoaderState>(
        builder: (context, state) {
      Widget returnValue = Container();
      if (state is PeriochartLoaderStateUninitialized) {
        this.bloc.add(LoadFromLocalHiveEvent(
            timestamp: DateTime.now(), loaderPcPropertiesId: 'file1'));
      } else if (state is PeriochartLoaderStateShowChart) {
        returnValue = Periochart(state.pcProperties);
      } else if (state is PeriochartLoaderStateProcessing) {
        returnValue = InitscreenSplash(
          title: state.title,
          description: state.description,
        );
      }
      return returnValue;
    }));
  }
}
