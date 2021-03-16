// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: return_of_invalid_type, constant_identifier_names, prefer_const_constructors_in_immutables, unnecessary_this, sort_unnamed_constructors_first, join_return_with_assignment, missing_return, lines_longer_than_80_chars

part of 'device_connect_state.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class DeviceConnectState extends Equatable {
  const DeviceConnectState(this._type);

  factory DeviceConnectState.loading() = Loading.create;

  factory DeviceConnectState.connected() = Connected.create;

  factory DeviceConnectState.errorConnecting() = ErrorConnecting.create;

  factory DeviceConnectState.disconnected() = Disconnected.create;

  final _DeviceConnectState _type;

  /// The [when] method is the equivalent to pattern matching.
  /// Its prototype depends on the _DeviceConnectState [_type]s defined.
  R when<R extends Object>(
      {@required R Function() loading,
      @required R Function() connected,
      @required R Function() errorConnecting,
      @required R Function() disconnected}) {
    assert(() {
      if (loading == null ||
          connected == null ||
          errorConnecting == null ||
          disconnected == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _DeviceConnectState.Loading:
        return loading();
      case _DeviceConnectState.Connected:
        return connected();
      case _DeviceConnectState.ErrorConnecting:
        return errorConnecting();
      case _DeviceConnectState.Disconnected:
        return disconnected();
    }
  }

  /// The [whenOrElse] method is equivalent to [when], but doesn't require
  /// all callbacks to be specified.
  ///
  /// On the other hand, it adds an extra orElse required parameter,
  /// for fallback behavior.
  R whenOrElse<R extends Object>(
      {R Function() loading,
      R Function() connected,
      R Function() errorConnecting,
      R Function() disconnected,
      @required R Function(DeviceConnectState) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _DeviceConnectState.Loading:
        if (loading == null) break;
        return loading();
      case _DeviceConnectState.Connected:
        if (connected == null) break;
        return connected();
      case _DeviceConnectState.ErrorConnecting:
        if (errorConnecting == null) break;
        return errorConnecting();
      case _DeviceConnectState.Disconnected:
        if (disconnected == null) break;
        return disconnected();
    }
    return orElse(this);
  }

  /// The [whenPartial] method is equivalent to [whenOrElse],
  /// but non-exhaustive.
  void whenPartial(
      {void Function() loading,
      void Function() connected,
      void Function() errorConnecting,
      void Function() disconnected}) {
    assert(() {
      if (loading == null &&
          connected == null &&
          errorConnecting == null &&
          disconnected == null) {
        throw 'provide at least one branch';
      }
      return true;
    }());
    switch (this._type) {
      case _DeviceConnectState.Loading:
        if (loading == null) break;
        return loading();
      case _DeviceConnectState.Connected:
        if (connected == null) break;
        return connected();
      case _DeviceConnectState.ErrorConnecting:
        if (errorConnecting == null) break;
        return errorConnecting();
      case _DeviceConnectState.Disconnected:
        if (disconnected == null) break;
        return disconnected();
    }
  }

  @override
  List<Object> get props => const [];
}

@immutable
abstract class Loading extends DeviceConnectState {
  const Loading() : super(_DeviceConnectState.Loading);

  factory Loading.create() = _LoadingImpl;
}

@immutable
class _LoadingImpl extends Loading {
  const _LoadingImpl() : super();

  @override
  String toString() => 'Loading()';
}

@immutable
abstract class Connected extends DeviceConnectState {
  const Connected() : super(_DeviceConnectState.Connected);

  factory Connected.create() = _ConnectedImpl;
}

@immutable
class _ConnectedImpl extends Connected {
  const _ConnectedImpl() : super();

  @override
  String toString() => 'Connected()';
}

@immutable
abstract class ErrorConnecting extends DeviceConnectState {
  const ErrorConnecting() : super(_DeviceConnectState.ErrorConnecting);

  factory ErrorConnecting.create() = _ErrorConnectingImpl;
}

@immutable
class _ErrorConnectingImpl extends ErrorConnecting {
  const _ErrorConnectingImpl() : super();

  @override
  String toString() => 'ErrorConnecting()';
}

@immutable
abstract class Disconnected extends DeviceConnectState {
  const Disconnected() : super(_DeviceConnectState.Disconnected);

  factory Disconnected.create() = _DisconnectedImpl;
}

@immutable
class _DisconnectedImpl extends Disconnected {
  const _DisconnectedImpl() : super();

  @override
  String toString() => 'Disconnected()';
}
