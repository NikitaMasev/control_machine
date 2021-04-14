// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: return_of_invalid_type, constant_identifier_names, prefer_const_constructors_in_immutables, unnecessary_this, sort_unnamed_constructors_first, join_return_with_assignment, missing_return, lines_longer_than_80_chars

part of 'device_control_event.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class DeviceControlEvent extends Equatable {
  const DeviceControlEvent(this._type);

  factory DeviceControlEvent.send({required int x, required int y}) =
      Send.create;

  final _DeviceControlEvent _type;

  /// The [when] method is the equivalent to pattern matching.
  /// Its prototype depends on the _DeviceControlEvent [_type]s defined.
  R when<R extends Object>({required R Function(Send) send}) {
    switch (this._type) {
      case _DeviceControlEvent.Send:
        return send(this as Send);
    }
  }

  /// The [whenOrElse] method is equivalent to [when], but doesn't require
  /// all callbacks to be specified.
  ///
  /// On the other hand, it adds an extra orElse required parameter,
  /// for fallback behavior.
  R whenOrElse<R extends Object>(
      {R Function(Send)? send,
      required R Function(DeviceControlEvent) orElse}) {
    switch (this._type) {
      case _DeviceControlEvent.Send:
        if (send == null) break;
        return send(this as Send);
    }
    return orElse(this);
  }

  /// The [whenPartial] method is equivalent to [whenOrElse],
  /// but non-exhaustive.
  void whenPartial({void Function(Send)? send}) {
    assert(() {
      if (send == null) {
        throw 'provide at least one branch';
      }
      return true;
    }());
    switch (this._type) {
      case _DeviceControlEvent.Send:
        if (send == null) break;
        return send(this as Send);
    }
  }

  @override
  List<Object> get props => const [];
}

@immutable
abstract class Send extends DeviceControlEvent {
  const Send({required this.x, required this.y})
      : super(_DeviceControlEvent.Send);

  factory Send.create({required int x, required int y}) = _SendImpl;

  final int x;

  final int y;

  /// Creates a copy of this Send but with the given fields
  /// replaced with the new values.
  Send copyWith({int x, int y});
}

@immutable
class _SendImpl extends Send {
  const _SendImpl({required this.x, required this.y}) : super(x: x, y: y);

  @override
  final int x;

  @override
  final int y;

  @override
  _SendImpl copyWith({Object x = superEnum, Object y = superEnum}) => _SendImpl(
        x: x == superEnum ? this.x : x as int,
        y: y == superEnum ? this.y : y as int,
      );
  @override
  String toString() => 'Send(x: ${this.x}, y: ${this.y})';
  @override
  List<Object> get props => [x, y];
}
