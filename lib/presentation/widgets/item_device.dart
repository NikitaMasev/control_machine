import 'package:control_machine/data/models/device.dart';
import 'package:flutter/material.dart';

class ItemDevice extends StatelessWidget {
  final Device device;
  final Function(Device) tap;

  const ItemDevice({
    @required this.device,
    @required this.tap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.bluetooth,
        color: Theme.of(context).textTheme.headline1.color,
      ),
      title: Text(
        device.name,
        style: Theme.of(context).textTheme.headline1,
      ),
      subtitle: Text(
        device.id,
        style: Theme.of(context).textTheme.headline1,
      ),
      onTap: () => tap?.call(device),
    );
  }
}