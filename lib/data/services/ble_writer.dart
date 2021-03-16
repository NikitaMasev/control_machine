import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';

abstract class BleWriter {
  Future<void> send(QualifiedCharacteristic characteristic, List<int> data);
}

class BleWriterImpl implements BleWriter {
  final FlutterReactiveBle _ble;

  BleWriterImpl(this._ble);

  @override
  Future<void> send(QualifiedCharacteristic characteristic, List<int> data) {
    return _ble.writeCharacteristicWithoutResponse(characteristic, value: data);
  }
}
