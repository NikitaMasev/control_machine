import 'package:control_machine/data/repositories/devices_repository.dart';
import 'package:control_machine/data/services/ble_connector.dart';
import 'package:control_machine/data/services/ble_scanner.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:super_enum/super_enum.dart';

part 'splash_state.super.dart';

@superEnum
enum _SplashState {
  @object
  Loading,
  @Data(fields: [
    DataField<Scanner>('scanner'),
    DataField<DevicesRepository>('devicesRepository'),
    DataField<FlutterReactiveBle>('ble'),
  ])
  Initialized,
}
