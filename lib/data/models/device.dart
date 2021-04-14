import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'device.g.dart';

@JsonSerializable()
class Device {
  final String? id;
  final String? name;
  final String? password;

  const Device({
    required this.id,
    required this.name,
    this.password,
  });

  factory Device.empty() => Device(id: null, password: null, name: null);

  factory Device.fromJson(Map<String, dynamic> json) => _$DeviceFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceToJson(this);

  bool get isEmpty => id == null && password == null;
}
