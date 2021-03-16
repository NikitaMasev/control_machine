import 'package:control_machine/data/models/device.dart';
import 'package:control_machine/presentation/controllers/devices_loading_controller.dart';
import 'package:control_machine/presentation/controllers/devices_loading_state.dart';
import 'package:control_machine/presentation/navigation/flow.dart';
import 'package:control_machine/presentation/widgets/item_device.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Devices extends StatelessWidget {
  final List<Device> devices;
  final VoidCallback pagePushed;
  final VoidCallback pagePopped;

  const Devices({
    Key key,
    @required this.devices,
    @required this.pagePushed,
    @required this.pagePopped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: devices.length,
      itemBuilder: (ctx, index) => ItemDevice(
        device: devices[index],
        tap: (device) {
         pagePushed();
          Navigator.of(context)
              .push(RouteFlow.connectAndControlFlow(context, device))
              .then((value) => pagePopped());
        },
      ),
    );
  }
}
