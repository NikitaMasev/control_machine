import 'dart:async';

import 'package:control_machine/data/services/ble_characteristic_scanner.dart';
import 'package:control_machine/data/services/ble_writer.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';

abstract class MachineController {
  ///Should call at first
  Future<void> start(String deviceId);

  Future<void> send(String dataX, String dataY);

  Future<void> dispose();
}

class MachineControllerImpl implements MachineController {
  final BleWriter bleWriter;
  final CharacteristicScanner characteristicScanner;
  final Duration timeoutStart;
  final Duration timeoutPingConnection;

  late QualifiedCharacteristic _qualifiedCharacteristic;
  Timer? _timerPing;
  static const _END_PACKAGE = ';';
  static const _SYMBOL_PING = 'S';
  static const _SYMBOL_DATA_X = 'X';
  static const _SYMBOL_DATA_Y = 'Y';

  MachineControllerImpl({
    required this.bleWriter,
    required this.characteristicScanner,
    this.timeoutStart = const Duration(seconds: 5),
    this.timeoutPingConnection = const Duration(milliseconds: 500),
  });

  @override
  Future<void> send(String dataX, String dataY) async {
    _timerPing?.cancel();

    final data =
        '$_SYMBOL_DATA_X$dataX$_SYMBOL_DATA_Y$dataY$_END_PACKAGE'.codeUnits;
    await bleWriter.send(_qualifiedCharacteristic, data);

    _startTimerPing();
  }

  @override
  Future<void> start(String deviceId) async {
    try {
      _qualifiedCharacteristic =
          await characteristicScanner.get(deviceId).timeout(timeoutStart);

      _startTimerPing();
    } on Exception {
      rethrow;
    }
  }

  void _onTimerPingTrigger() {
    final data = '$_SYMBOL_PING$_END_PACKAGE'.codeUnits;
    bleWriter
        .send(_qualifiedCharacteristic, data)
        .then((_) => _startTimerPing());
  }

  void _startTimerPing() {
    _timerPing?.cancel();
    _timerPing = Timer(timeoutPingConnection, _onTimerPingTrigger);
  }

  @override
  Future<void> dispose() async {
    _timerPing?.cancel();
  }
}
