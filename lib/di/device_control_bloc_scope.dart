import 'package:control_machine/data/models/device.dart';
import 'package:control_machine/domain/blocs/device_control/bloc.dart';
import 'package:control_machine/domain/controllers/machine_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeviceControlBlocScope extends StatelessWidget {
  final Widget child;

  const DeviceControlBlocScope({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => DeviceControlBloc(
        ctx.read<MachineController>(),
        ctx.read<Device>().id!,
      )..add(DeviceControlEvent.send(x: 0, y: 0)),
      child: child,
    );
  }
}