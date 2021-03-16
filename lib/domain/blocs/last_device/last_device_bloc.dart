import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:control_machine/data/repositories/devices_repository.dart';
import 'package:control_machine/domain/blocs/last_device/bloc.dart';

class LastDeviceBloc extends Bloc<LastDeviceEvent, LastDeviceState> {
  final DevicesRepository _devicesRepository;

  LastDeviceBloc(this._devicesRepository) : super(LastDeviceState.loading());

  @override
  Stream<LastDeviceState> mapEventToState(
    LastDeviceEvent event,
  ) async* {
    yield* event.when(
      get: _eventGet,
      removeDevice: _eventRemoveDevice,
      saveDevice: _eventSaveDevice,
    );
  }

  Stream<LastDeviceState> _eventRemoveDevice() async* {
    await _devicesRepository.saveLastConnectedDevice(null);
  }

  Stream<LastDeviceState> _eventSaveDevice(SaveDevice e) async* {
    await _devicesRepository.saveLastConnectedDevice(e.device);
  }

  Stream<LastDeviceState> _eventGet() async* {
    yield LastDeviceState.loading();

    try {
      final device = await _devicesRepository
          .getLastConnectedDevice()
          .timeout(Duration(seconds: 5));

      if (device == null) {
        yield LastDeviceState.loading();
      } else if (device.isEmpty) {
        yield LastDeviceState.empty();
      } else {
        yield LastDeviceState.loaded(device: device);
      }
    } on Exception {
      yield LastDeviceState.error();
    }
  }
}