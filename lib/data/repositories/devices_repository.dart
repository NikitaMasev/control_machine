import 'package:control_machine/data/models/device.dart';
import 'package:control_machine/data/sources/devices_storage.dart';

abstract class DevicesRepository {
  Future<Device> getLastConnectedDevice();

  Future<void> saveLastConnectedDevice(Device device);
}

class DevicesRepositoryImpl implements DevicesRepository {
  final DevicesStorage _devicesStorage;

  DevicesRepositoryImpl(this._devicesStorage);

  @override
  Future<Device> getLastConnectedDevice() {
    return _devicesStorage.lastDevice();
  }

  @override
  Future<void> saveLastConnectedDevice(Device device) {
    return _devicesStorage.saveDevice(device);
  }
}