import 'package:control_machine/data/models/device.dart';
import 'package:control_machine/di/connector_scope.dart';
import 'package:control_machine/domain/blocs/last_device/bloc.dart';
import 'package:control_machine/presentation/pages/control_device_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:provider/provider.dart';

class RouteFlow {
  static MaterialPageRoute connectAndControlFlow(BuildContext context, Device device)=>MaterialPageRoute(
    builder: (ctx) => MultiProvider(
      providers: [
        Provider.value(value: context.read<FlutterReactiveBle>()),
        Provider.value(value: device),
      ],
      child: BlocProvider.value(
        value: context.read<LastDeviceBloc>(),
        child: ConnectorScope(
          child: ControlDevicePage(),
        ),
      ),
    ),
  );
}