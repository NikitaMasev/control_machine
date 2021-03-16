import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:control_machine/data/services/ble_connector.dart';
import 'package:control_machine/domain/blocs/device_connect/bloc.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';

class DeviceConnectBloc extends Bloc<DeviceConnectEvent, DeviceConnectState> {
  final Connector _connector;
  StreamSubscription _subConnectionStatus;

  DeviceConnectBloc(
    this._connector,
  ) : super(DeviceConnectState.loading());

  @override
  Stream<DeviceConnectState> mapEventToState(
    DeviceConnectEvent event,
  ) async* {
    yield* event.when(
      connect: _eventConnect,
      disconnect: _eventDisconnect,
      connectionUpdate: _eventConnectionStateUpdate,
    );
  }

  Stream<DeviceConnectState> _eventConnectionStateUpdate(
    ConnectionUpdate e,
  ) async* {
    switch (e.connectionState) {
      case DeviceConnectionState.connecting:
        print('CONNECTING');
        break;
      case DeviceConnectionState.connected:
        yield DeviceConnectState.connected();
        break;
      case DeviceConnectionState.disconnecting:
        print('DISCONNECTING');
        break;
      case DeviceConnectionState.disconnected:
        yield DeviceConnectState.disconnected();
        break;
    }
  }

  Stream<DeviceConnectState> _eventConnect(
    Connect e,
  ) async* {
    yield DeviceConnectState.loading();
    _subConnectionStatus?.cancel();
    _subConnectionStatus = _connector.getConnectionState()
        .listen(
          (event) => add(
            DeviceConnectEvent.connectionUpdate(
              connectionState: event,
            ),
          ),
        );

    await _connector.connect(e.device.id);
  }

  Stream<DeviceConnectState> _eventDisconnect() async* {
    await _connector.disconnect();
  }

  @override
  Future<void> close() async {
    await _connector.disconnect();
    await _subConnectionStatus?.cancel();
    return super.close();
  }
}