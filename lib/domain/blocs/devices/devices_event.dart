import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:super_enum/super_enum.dart';

part 'devices_event.super.dart';

@superEnum
enum _DevicesEvent {
  @object
  Search,
  @Data(fields: [DataField<List<DiscoveredDevice>>('devices')])
  DevicesFounded,
  @object
  StopSearch,
}
