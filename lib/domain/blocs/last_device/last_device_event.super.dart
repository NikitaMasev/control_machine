// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: return_of_invalid_type, constant_identifier_names, prefer_const_constructors_in_immutables, unnecessary_this, sort_unnamed_constructors_first, join_return_with_assignment, missing_return, lines_longer_than_80_chars

part of 'last_device_event.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class LastDeviceEvent extends Equatable {
  const LastDeviceEvent(this._type);

  factory LastDeviceEvent.get() = Get.create;

  factory LastDeviceEvent.saveDevice({required Device device}) =
      SaveDevice.create;

  factory LastDeviceEvent.removeDevice() = RemoveDevice.create;

  final _LastDeviceEvent _type;

  /// The [when] method is the equivalent to pattern matching.
  /// Its prototype depends on the _LastDeviceEvent [_type]s defined.
  R when<R extends Object>(
      {required R Function() get,
      required R Function(SaveDevice) saveDevice,
      required R Function() removeDevice}) {
    switch (this._type) {
      case _LastDeviceEvent.Get:
        return get();
      case _LastDeviceEvent.SaveDevice:
        return saveDevice(this as SaveDevice);
      case _LastDeviceEvent.RemoveDevice:
        return removeDevice();
    }
  }

  /// The [whenOrElse] method is equivalent to [when], but doesn't require
  /// all callbacks to be specified.
  ///
  /// On the other hand, it adds an extra orElse required parameter,
  /// for fallback behavior.
  R whenOrElse<R extends Object>(
      {R Function()? get,
      R Function(SaveDevice)? saveDevice,
      R Function()? removeDevice,
      required R Function(LastDeviceEvent) orElse}) {
    switch (this._type) {
      case _LastDeviceEvent.Get:
        if (get == null) break;
        return get();
      case _LastDeviceEvent.SaveDevice:
        if (saveDevice == null) break;
        return saveDevice(this as SaveDevice);
      case _LastDeviceEvent.RemoveDevice:
        if (removeDevice == null) break;
        return removeDevice();
    }
    return orElse(this);
  }

  /// The [whenPartial] method is equivalent to [whenOrElse],
  /// but non-exhaustive.
  void whenPartial(
      {void Function()? get,
      void Function(SaveDevice)? saveDevice,
      void Function()? removeDevice}) {
    assert(() {
      if (get == null && saveDevice == null && removeDevice == null) {
        throw 'provide at least one branch';
      }
      return true;
    }());
    switch (this._type) {
      case _LastDeviceEvent.Get:
        if (get == null) break;
        return get();
      case _LastDeviceEvent.SaveDevice:
        if (saveDevice == null) break;
        return saveDevice(this as SaveDevice);
      case _LastDeviceEvent.RemoveDevice:
        if (removeDevice == null) break;
        return removeDevice();
    }
  }

  @override
  List<Object> get props => const [];
}

@immutable
abstract class Get extends LastDeviceEvent {
  const Get() : super(_LastDeviceEvent.Get);

  factory Get.create() = _GetImpl;
}

@immutable
class _GetImpl extends Get {
  const _GetImpl() : super();

  @override
  String toString() => 'Get()';
}

@immutable
abstract class SaveDevice extends LastDeviceEvent {
  const SaveDevice({required this.device}) : super(_LastDeviceEvent.SaveDevice);

  factory SaveDevice.create({required Device device}) = _SaveDeviceImpl;

  final Device device;

  /// Creates a copy of this SaveDevice but with the given fields
  /// replaced with the new values.
  SaveDevice copyWith({Device device});
}

@immutable
class _SaveDeviceImpl extends SaveDevice {
  const _SaveDeviceImpl({required this.device}) : super(device: device);

  @override
  final Device device;

  @override
  _SaveDeviceImpl copyWith({Object device = superEnum}) => _SaveDeviceImpl(
        device: device == superEnum ? this.device : device as Device,
      );
  @override
  String toString() => 'SaveDevice(device: ${this.device})';
  @override
  List<Object> get props => [device];
}

@immutable
abstract class RemoveDevice extends LastDeviceEvent {
  const RemoveDevice() : super(_LastDeviceEvent.RemoveDevice);

  factory RemoveDevice.create() = _RemoveDeviceImpl;
}

@immutable
class _RemoveDeviceImpl extends RemoveDevice {
  const _RemoveDeviceImpl() : super();

  @override
  String toString() => 'RemoveDevice()';
}
