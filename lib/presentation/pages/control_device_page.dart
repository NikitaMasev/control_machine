import 'package:control_machine/data/models/device.dart';
import 'package:control_machine/data/services/ble_connector.dart';
import 'package:control_machine/di/controller_scope.dart';
import 'package:control_machine/domain/blocs/device_connect/bloc.dart';
import 'package:control_machine/domain/blocs/last_device/bloc.dart';
import 'package:control_machine/presentation/widgets/error_form.dart';
import 'package:control_machine/presentation/widgets/joystick.dart';
import 'package:control_machine/presentation/widgets/loading_indicator.dart';
import 'package:control_machine/presentation/widgets/text_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ControlDevicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: SafeArea(
        child: BlocProvider(
          create: (ctx) => DeviceConnectBloc(context.read<Connector>())
            ..add(
              DeviceConnectEvent.connect(
                device: context.read<Device>(),
              ),
            ),
          child: BlocConsumer<DeviceConnectBloc, DeviceConnectState>(
            listener: (ctx, state) => state.whenPartial(
              disconnected: () => Navigator.of(context).pop(),
              connected: () => ctx.read<LastDeviceBloc>().add(
                    LastDeviceEvent.saveDevice(device: context.read<Device>()),
                  ),
            ),
            builder: (ctx, state) => state.when(
              loading: () => LoadingIndicator(),
              connected: () => ControllerScope(child: JoyStick()),
              errorConnecting: () => ErrorForm(
                error: 'Не удалось подключиться к устройству.',
                retry: () => DeviceConnectBloc(context.read<Connector>())
                  ..add(
                    DeviceConnectEvent.connect(
                      device: context.read<Device>(),
                    ),
                  ),
              ),
              disconnected: () => TextInfo(text: 'Устройство отключено.'),
            ),
          ),
        ),
      ),
    );
  }
}
