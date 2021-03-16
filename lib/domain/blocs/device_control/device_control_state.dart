import 'package:super_enum/super_enum.dart';

part 'device_control_state.super.dart';

@superEnum
enum _DeviceControlState {
  @object
  Loading,
  @object
  Loaded,
  @object
  Error,
}
