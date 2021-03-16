import 'package:super_enum/super_enum.dart';

part 'device_control_event.super.dart';

@superEnum
enum _DeviceControlEvent {
  @Data(fields: [
    DataField<int>('x'),
    DataField<int>('y'),
  ])
  Send,
}
