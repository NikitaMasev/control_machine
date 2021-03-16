import 'dart:async';

import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:rxdart/rxdart.dart';

abstract class Scanner {
  Stream<List<DiscoveredDevice>> devices();

  void startScan({List<Uuid> serviceIds = const []});

  Future<void> stopScan();

  Future<void> dispose();
}

class BleScanner implements Scanner {
  final FlutterReactiveBle _ble;

  final _streamDevices = BehaviorSubject<List<DiscoveredDevice>>();
  final _devices = <DiscoveredDevice>[];

  StreamSubscription _subDevices;

  BleScanner(this._ble);

  @override
  Future<void> dispose() async {
    await _subDevices?.cancel();
    await _streamDevices.close();
  }

  @override
  Stream<List<DiscoveredDevice>> devices() =>
      _streamDevices.asBroadcastStream();

  @override
  void startScan({List<Uuid> serviceIds = const []}) {
    _devices.clear();
    _subDevices?.cancel();
    _subDevices = _ble.scanForDevices(withServices: serviceIds).listen((device) {
          final knownDeviceIndex = _devices.indexWhere((d) => d.id == device.id);
          if (knownDeviceIndex >= 0) {
            _devices[knownDeviceIndex] = device;
          } else {
            _devices.add(device);
          }

          _streamDevices.add(_devices);
        });
  }

  @override
  Future<void> stopScan() async {
    await _subDevices?.cancel();
  }
}