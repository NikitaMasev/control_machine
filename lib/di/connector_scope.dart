import 'package:control_machine/data/services/ble_connector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:provider/provider.dart';

class ConnectorScope extends StatelessWidget {
  final Widget child;

  const ConnectorScope({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Connector>.value(
          value: BleConnector(
            context.read<FlutterReactiveBle>(),
          ),
        ),
      ],
      child: child,
    );
  }
}
