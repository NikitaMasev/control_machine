import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';


abstract class CharacteristicScanner {
  Future<QualifiedCharacteristic> get(String deviceId);
}

class BleCharacteristicScanner implements CharacteristicScanner {
  final FlutterReactiveBle _ble;

  BleCharacteristicScanner(this._ble);

  @override
  Future<QualifiedCharacteristic> get(String deviceId) {
    return _ble.discoverServices(deviceId).then(
          (value) => QualifiedCharacteristic(
            deviceId: deviceId,
            serviceId: value[2].serviceId, //where FF...
            characteristicId: value[2].characteristicIds.first,
          ),
        );
  }
}