import 'package:control_machine/data/models/device.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:super_enum/super_enum.dart';

part 'device_connect_event.super.dart';

@superEnum
enum _DeviceConnectEvent {
  @Data(fields: [
    DataField<Device>('device'),
  ])
  Connect,
  @object
  Disconnect,
  @Data(fields: [DataField<DeviceConnectionState>('connectionState')])
  ConnectionUpdate,
}
