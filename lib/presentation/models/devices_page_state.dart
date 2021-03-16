import 'package:control_machine/data/models/device.dart';
import 'package:super_enum/super_enum.dart';

part 'devices_page_state.super.dart';

@superEnum
enum _DevicesPageState {
  @object
  Loading,
  @Data(fields: [
    DataField<List<Device>>('devices'),
  ])
  Loaded,
  @object
  Error,
}
