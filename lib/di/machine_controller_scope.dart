import 'package:control_machine/data/services/ble_characteristic_scanner.dart';
import 'package:control_machine/data/services/ble_writer.dart';
import 'package:control_machine/domain/controllers/machine_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MachineControllerScope extends StatelessWidget {
  final Widget child;

  const MachineControllerScope({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<MachineController>.value(
      value: MachineControllerImpl(
        characteristicScanner: context.read<CharacteristicScanner>(),
        bleWriter: context.read<BleWriter>(),
      ),
      child: child,
    );
  }
}
