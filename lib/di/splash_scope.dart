import 'package:control_machine/domain/blocs/splash/bloc.dart';
import 'package:control_machine/presentation/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class SplashScope extends StatelessWidget {
  final Widget child;

  const SplashScope({
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => SplashBloc()..add(SplashEvent.init()),
      child: BlocBuilder<SplashBloc, SplashState>(
        builder: (ctx, state) => state.when(
          loading: () => LoadingIndicator(),
          initialized: (s) => MultiProvider(
            providers: [
              Provider.value(value: s.devicesRepository),
              Provider.value(value: s.scanner),
              Provider.value(value: s.ble),
            ],
            child: child,
          ),
        ),
      ),
    );
  }
}