import 'package:control_machine/data/models/device.dart';
import 'package:super_enum/super_enum.dart';

part 'last_device_event.super.dart';

@superEnum
enum _LastDeviceEvent {
  @object
  Get,
  @Data(fields: [DataField<Device>('device')])
  SaveDevice,
  @object
  RemoveDevice,
}
