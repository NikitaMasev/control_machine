import 'package:control_machine/data/models/device.dart';
import 'package:control_machine/presentation/widgets/item_device.dart';
import 'package:flutter/material.dart';

class Devices extends StatelessWidget {
  final List<Device> devices;
  final Function(Device) deviceClicked;

  const Devices({
    Key key,
    @required this.devices,
    @required this.deviceClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: devices.length,
      itemBuilder: (ctx, index) => ItemDevice(
        device: devices[index],
        tap: deviceClicked,
      ),
    );
  }
}