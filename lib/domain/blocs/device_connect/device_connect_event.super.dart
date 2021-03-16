// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: return_of_invalid_type, constant_identifier_names, prefer_const_constructors_in_immutables, unnecessary_this, sort_unnamed_constructors_first, join_return_with_assignment, missing_return, lines_longer_than_80_chars

part of 'device_connect_event.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class DeviceConnectEvent extends Equatable {
  const DeviceConnectEvent(this._type);

  factory DeviceConnectEvent.connect({@required Device device}) =
      Connect.create;

  factory DeviceConnectEvent.disconnect() = Disconnect.create;

  factory DeviceConnectEvent.connectionUpdate(
          {@required DeviceConnectionState connectionState}) =
      ConnectionUpdate.create;

  final _DeviceConnectEvent _type;

  /// The [when] method is the equivalent to pattern matching.
  /// Its prototype depends on the _DeviceConnectEvent [_type]s defined.
  R when<R extends Object>(
      {@required R Function(Connect) connect,
      @required R Function() disconnect,
      @required R Function(ConnectionUpdate) connectionUpdate}) {
    assert(() {
      if (connect == null || disconnect == null || connectionUpdate == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _DeviceConnectEvent.Connect:
        return connect(this as Connect);
      case _DeviceConnectEvent.Disconnect:
        return disconnect();
      case _DeviceConnectEvent.ConnectionUpdate:
        return connectionUpdate(this as ConnectionUpdate);
    }
  }

  /// The [whenOrElse] method is equivalent to [when], but doesn't require
  /// all callbacks to be specified.
  ///
  /// On the other hand, it adds an extra orElse required parameter,
  /// for fallback behavior.
  R whenOrElse<R extends Object>(
      {R Function(Connect) connect,
      R Function() disconnect,
      R Function(ConnectionUpdate) connectionUpdate,
      @required R Function(DeviceConnectEvent) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _DeviceConnectEvent.Connect:
        if (connect == null) break;
        return connect(this as Connect);
      case _DeviceConnectEvent.Disconnect:
        if (disconnect == null) break;
        return disconnect();
      case _DeviceConnectEvent.ConnectionUpdate:
        if (connectionUpdate == null) break;
        return connectionUpdate(this as ConnectionUpdate);
    }
    return orElse(this);
  }

  /// The [whenPartial] method is equivalent to [whenOrElse],
  /// but non-exhaustive.
  void whenPartial(
      {void Function(Connect) connect,
      void Function() disconnect,
      void Function(ConnectionUpdate) connectionUpdate}) {
    assert(() {
      if (connect == null && disconnect == null && connectionUpdate == null) {
        throw 'provide at least one branch';
      }
      return true;
    }());
    switch (this._type) {
      case _DeviceConnectEvent.Connect:
        if (connect == null) break;
        return connect(this as Connect);
      case _DeviceConnectEvent.Disconnect:
        if (disconnect == null) break;
        return disconnect();
      case _DeviceConnectEvent.ConnectionUpdate:
        if (connectionUpdate == null) break;
        return connectionUpdate(this as ConnectionUpdate);
    }
  }

  @override
  List<Object> get props => const [];
}

@immutable
abstract class Connect extends DeviceConnectEvent {
  const Connect({@required this.device}) : super(_DeviceConnectEvent.Connect);

  factory Connect.create({@required Device device}) = _ConnectImpl;

  final Device device;

  /// Creates a copy of this Connect but with the given fields
  /// replaced with the new values.
  Connect copyWith({Device device});
}

@immutable
class _ConnectImpl extends Connect {
  const _ConnectImpl({@required this.device}) : super(device: device);

  @override
  final Device device;

  @override
  _ConnectImpl copyWith({Object device = superEnum}) => _ConnectImpl(
        device: device == superEnum ? this.device : device as Device,
      );
  @override
  String toString() => 'Connect(device: ${this.device})';
  @override
  List<Object> get props => [device];
}

@immutable
abstract class Disconnect extends DeviceConnectEvent {
  const Disconnect() : super(_DeviceConnectEvent.Disconnect);

  factory Disconnect.create() = _DisconnectImpl;
}

@immutable
class _DisconnectImpl extends Disconnect {
  const _DisconnectImpl() : super();

  @override
  String toString() => 'Disconnect()';
}

@immutable
abstract class ConnectionUpdate extends DeviceConnectEvent {
  const ConnectionUpdate({@required this.connectionState})
      : super(_DeviceConnectEvent.ConnectionUpdate);

  factory ConnectionUpdate.create(
          {@required DeviceConnectionState connectionState}) =
      _ConnectionUpdateImpl;

  final DeviceConnectionState connectionState;

  /// Creates a copy of this ConnectionUpdate but with the given fields
  /// replaced with the new values.
  ConnectionUpdate copyWith({DeviceConnectionState connectionState});
}

@immutable
class _ConnectionUpdateImpl extends ConnectionUpdate {
  const _ConnectionUpdateImpl({@required this.connectionState})
      : super(connectionState: connectionState);

  @override
  final DeviceConnectionState connectionState;

  @override
  _ConnectionUpdateImpl copyWith({Object connectionState = superEnum}) =>
      _ConnectionUpdateImpl(
        connectionState: connectionState == superEnum
            ? this.connectionState
            : connectionState as DeviceConnectionState,
      );
  @override
  String toString() =>
      'ConnectionUpdate(connectionState: ${this.connectionState})';
  @override
  List<Object> get props => [connectionState];
}
