import 'package:control_machine/domain/blocs/devices/bloc.dart';
import 'package:control_machine/presentation/widgets/devices.dart';
import 'package:control_machine/presentation/widgets/error_form.dart';
import 'package:control_machine/presentation/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DevicesPage extends StatelessWidget {
  static const _notFoundedDevices = 'Не удалось получить список устройств';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DevicesBloc, DevicesState>(
      builder: (ctx, state) => state.when(
        loading: () => LoadingIndicator(),
        loaded: (s) => Devices(devices: s.devices),
        error: () => ErrorForm(
          error: DevicesPage._notFoundedDevices,
          retry: () => ctx.read<DevicesBloc>().add(DevicesEvent.search()),
        ),
      ),
    );
  }
}
