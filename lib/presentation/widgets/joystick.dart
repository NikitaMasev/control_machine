import 'dart:math';

import 'package:control_machine/domain/blocs/device_control/bloc.dart';
import 'package:control_machine/presentation/widgets/error_form.dart';
import 'package:control_machine/presentation/widgets/joystick_view.dart';
import 'package:control_machine/presentation/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class JoyStick extends StatelessWidget {
  static const _MAX_VAL_COORDINATE_ARDUINO = 255;

  @override
  Widget build(BuildContext context) {
    final size = min<double>(MediaQuery.of(context).size.height,
        MediaQuery.of(context).size.width);
    final maxValCoordinate = size / 2;
    return BlocBuilder<DeviceControlBloc, DeviceControlState>(
      builder: (ctx, state) => state.when(
        loading: () => LoadingIndicator(),
        loaded: () => JoystickView(
          size: size,
          onCoordinatesChanged: (x, y) {
            final normalizedX = _normalizeValue(x, maxValCoordinate);
            final normalizedY = _normalizeValue(y, maxValCoordinate);
            ctx
                .read<DeviceControlBloc>()
                .add(DeviceControlEvent.send(x: normalizedX, y: normalizedY));
          },
          interval: const Duration(milliseconds: 30),
        ),
        error: () => ErrorForm(
          error: 'Не удалось прочитать сервис устройства.',
          retry: () => ctx.read<DeviceControlBloc>().add(
                DeviceControlEvent.send(x: 0, y: 0),
              ),
        ),
      ),
    );
  }

  int _normalizeValue(double val, double maxVal) {
    var normalized =
        (JoyStick._MAX_VAL_COORDINATE_ARDUINO * val / maxVal).floor();

    if (normalized > 0 && normalized > JoyStick._MAX_VAL_COORDINATE_ARDUINO) {
      normalized = JoyStick._MAX_VAL_COORDINATE_ARDUINO;
    } else if (normalized < 0 &&
        normalized < -JoyStick._MAX_VAL_COORDINATE_ARDUINO) {
      normalized = -JoyStick._MAX_VAL_COORDINATE_ARDUINO;
    }
    return normalized;
  }
}
