import 'package:control_machine/data/models/device.dart';
import 'package:super_enum/super_enum.dart';

part 'devices_state.super.dart';

@superEnum
enum _DevicesState {
  @object
  Loading,
  @Data(fields: [
    DataField<List<Device>>('devices'),
    DataField<int>('length'),
  ])
  Loaded,
  @object
  Error,
  @object
  SearchStopped,
}
