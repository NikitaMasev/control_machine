import 'dart:convert';

import 'package:control_machine/data/models/device.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class DevicesStorage {
  Future<Device> lastDevice();

  Future<void> saveDevice(Device device);
}

class DevicesStorageImpl implements DevicesStorage {
  final SharedPreferences _shared;
  static const _KEY_LAST_DEVICE = 'LAST_D';

  DevicesStorageImpl(this._shared);

  @override
  Future<Device> lastDevice() async {
    final json = _shared.getString(_KEY_LAST_DEVICE);

    if (json == null) {
      return Device.empty();
    }
    return Device.fromJson(jsonDecode(json));
  }

  @override
  Future<void> saveDevice(Device device) {
    return _shared.setString(_KEY_LAST_DEVICE, jsonEncode(device.toJson()));
  }
}