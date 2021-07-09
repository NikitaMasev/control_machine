import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:control_machine/domain/blocs/device_control/bloc.dart';
import 'package:control_machine/domain/controllers/machine_controller.dart';

class DeviceControlBloc extends Bloc<DeviceControlEvent, DeviceControlState> {
  final MachineController _machineController;
  final String _deviceId;
  bool _controllerStarted = false;

  DeviceControlBloc(
    this._machineController,
    this._deviceId,
  ) : super(DeviceControlState.loading());

  @override
  Stream<DeviceControlState> mapEventToState(
    DeviceControlEvent event,
  ) async* {
    yield* event.when(
      send: _eventSend,
    );
  }

  Stream<DeviceControlState> _eventSend(
    Send e,
  ) async* {
    if (!_controllerStarted) {
      yield DeviceControlState.loading();
      try {
        await _machineController.start(_deviceId);
        _controllerStarted = true;

        yield DeviceControlState.loaded();
      } on Exception {
        yield DeviceControlState.error();
      }
    }

    await _machineController.send(e.x.toString(), e.y.toString());
  }

  @override
  Future<void> close() async {
    await _machineController.dispose();
    return super.close();
  }
}