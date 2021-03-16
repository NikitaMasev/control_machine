import 'package:control_machine/data/repositories/devices_repository.dart';
import 'package:control_machine/domain/blocs/last_device/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class LastDeviceScope extends StatelessWidget {
  final Widget child;

  const LastDeviceScope({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LastDeviceBloc>(
      create: (ctx) => LastDeviceBloc(ctx.read<DevicesRepository>())
        ..add(LastDeviceEvent.get()),
      child: child,
    );
  }
}