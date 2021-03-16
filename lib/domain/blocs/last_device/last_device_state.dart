import 'package:control_machine/data/models/device.dart';
import 'package:super_enum/super_enum.dart';

part 'last_device_state.super.dart';

@superEnum
enum _LastDeviceState {
  @object
  Loading,
  @Data(fields: [DataField<Device>('device')])
  Loaded,
  @object
  Error,
  @object
  Empty,
}
