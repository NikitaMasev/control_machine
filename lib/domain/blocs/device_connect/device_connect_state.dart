import 'package:super_enum/super_enum.dart';

part 'device_connect_state.super.dart';

@superEnum
enum _DeviceConnectState {
  @object
  Loading,
  @object
  Connected,
  @object
  ErrorConnecting,
  @object
  Disconnected,
}
