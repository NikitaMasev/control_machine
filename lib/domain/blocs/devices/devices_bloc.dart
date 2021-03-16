import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:control_machine/data/models/device.dart';
import 'package:control_machine/data/services/ble_scanner.dart';
import 'package:control_machine/domain/blocs/devices/bloc.dart';

class DevicesBloc extends Bloc<DevicesEvent, DevicesState> {
  final Scanner _scanner;
  StreamSubscription _subDevices;

  static const _unknown = 'Unknown';

  DevicesBloc(this._scanner) : super(DevicesState.loading());

  @override
  Stream<DevicesState> mapEventToState(
    DevicesEvent event,
  ) async* {
    yield* event.when(
      search: _eventSearch,
      devicesFounded: _eventDevicesFounded,
      stopSearch: _eventStopSearch,
    );
  }

  Stream<DevicesState> _eventSearch() async* {
    yield DevicesState.loading();

    _subDevices?.cancel();
    _subDevices = _scanner
        .devices()
        .listen((event) => add(DevicesEvent.devicesFounded(devices: event)));

    _scanner.startScan();
  }

  Stream<DevicesState> _eventDevicesFounded(DevicesFounded e) async* {
    final convertedDevices = e.devices
        .map((e) => Device(id: e.id, name: e.name.isEmpty ? _unknown : e.name))
        .toList();
    yield DevicesState.loaded(
      devices: convertedDevices,
      length: e.devices.length,
    );
  }

  Stream<DevicesState> _eventStopSearch() async* {
    await _scanner.stopScan();
  }

  @override
  Future<void> close() async {
    await _subDevices?.cancel();
    await _scanner.dispose();
    return super.close();
  }
}
