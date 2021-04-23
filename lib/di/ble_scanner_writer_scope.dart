import 'package:control_machine/data/services/ble_characteristic_scanner.dart';
import 'package:control_machine/data/services/ble_writer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:provider/provider.dart';

class BleScannerWriterScope extends StatelessWidget {
  final Widget child;

  const BleScannerWriterScope({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<CharacteristicScanner>.value(
          value: BleCharacteristicScanner(
            context.read<FlutterReactiveBle>(),
          ),
        ),
        Provider<BleWriter>.value(
          value: BleWriterImpl(
            context.read<FlutterReactiveBle>(),
          ),
        ),
      ],
      child: child,
    );
  }
}