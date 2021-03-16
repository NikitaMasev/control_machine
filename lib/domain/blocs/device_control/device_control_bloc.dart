import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:control_machine/data/services/ble_characteristic_scanner.dart';
import 'package:control_machine/data/services/ble_writer.dart';
import 'package:control_machine/domain/blocs/device_control/bloc.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';

class DeviceControlBloc extends Bloc<DeviceControlEvent, DeviceControlState> {
  final BleWriter _bleWriter;
  final CharacteristicScanner _characteristicScanner;
  final String deviceId;
  QualifiedCharacteristic _qualifiedCharacteristic;

  static const _END_PACKAGE = ';';

  DeviceControlBloc(
    this._bleWriter,
    this._characteristicScanner,
    this.deviceId,
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
    if (_qualifiedCharacteristic == null) {
      yield DeviceControlState.loading();
      try {
        _qualifiedCharacteristic = await _characteristicScanner
            .get(deviceId)
            .timeout(Duration(seconds: 5));

        yield DeviceControlState.loaded();
      } on Exception {
        yield DeviceControlState.error();
      }
    }

    final data = 'X${e.x}Y${e.y}$_END_PACKAGE'.codeUnits;

    await _bleWriter.send(_qualifiedCharacteristic, data);
  }
}