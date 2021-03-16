import 'package:control_machine/data/models/device.dart';
import 'package:control_machine/domain/blocs/devices/bloc.dart';
import 'package:control_machine/presentation/navigation/flow.dart';
import 'package:control_machine/presentation/widgets/item_device.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Devices extends StatelessWidget {
  final List<Device> devices;

  const Devices({
    Key key,
    @required this.devices,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: devices.length,
      itemBuilder: (ctx, index) => ItemDevice(
        device: devices[index],
        tap: (device) {
          context.read<DevicesBloc>().add(DevicesEvent.stopSearch());
          Navigator.of(context)
              .push(RouteFlow.connectAndControlFlow(context, device))
              .then((value) =>
                  context.read<DevicesBloc>().add(DevicesEvent.search()));
        },
      ),
    );
  }
}
