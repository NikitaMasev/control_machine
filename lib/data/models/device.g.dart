// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Device _$DeviceFromJson(Map<String, dynamic> json) {
  return Device(
    id: json['id'] as String?,
    name: json['name'] as String?,
    password: json['password'] as String?,
  );
}

Map<String, dynamic> _$DeviceToJson(Device instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'password': instance.password,
    };
