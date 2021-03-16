import 'dart:async';

import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:rxdart/rxdart.dart';

abstract class Connector {
  Future<void> connect(String deviceId);

  Future<void> disconnect();

  Stream<DeviceConnectionState> getConnectionState();

  Future<void> dispose();
}

class BleConnector implements Connector {
  final FlutterReactiveBle _ble;

  final _streamConnectionState = PublishSubject<DeviceConnectionState>();
  StreamSubscription _subConnection;

  BleConnector(this._ble);

  @override
  Future<void> connect(String deviceId) async {
    await _subConnection?.cancel();
    _subConnection = _ble
        .connectToDevice(
          id: deviceId,
          connectionTimeout: Duration(seconds: 4),
        )
        .listen((state) => _streamConnectionState.add(state.connectionState));
  }

  @override
  Future<void> disconnect() async {
    await _subConnection?.cancel();
  }

  @override
  Stream<DeviceConnectionState> getConnectionState() =>
      _streamConnectionState.asBroadcastStream();

  @override
  Future<void> dispose() async {
    await _subConnection?.cancel();
    await _streamConnectionState.close();
  }
}
