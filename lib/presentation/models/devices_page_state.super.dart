// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: return_of_invalid_type, constant_identifier_names, prefer_const_constructors_in_immutables, unnecessary_this, sort_unnamed_constructors_first, join_return_with_assignment, missing_return, lines_longer_than_80_chars

part of 'devices_page_state.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class DevicesPageState extends Equatable {
  const DevicesPageState(this._type);

  factory DevicesPageState.loading() = Loading.create;

  factory DevicesPageState.loaded({required List<Device> devices}) =
      Loaded.create;

  factory DevicesPageState.error() = Error.create;

  final _DevicesPageState _type;

  /// The [when] method is the equivalent to pattern matching.
  /// Its prototype depends on the _DevicesPageState [_type]s defined.
  R when<R extends Object>(
      {required R Function() loading,
      required R Function(Loaded) loaded,
      required R Function() error}) {
    switch (this._type) {
      case _DevicesPageState.Loading:
        return loading();
      case _DevicesPageState.Loaded:
        return loaded(this as Loaded);
      case _DevicesPageState.Error:
        return error();
    }
  }

  /// The [whenOrElse] method is equivalent to [when], but doesn't require
  /// all callbacks to be specified.
  ///
  /// On the other hand, it adds an extra orElse required parameter,
  /// for fallback behavior.
  R whenOrElse<R extends Object>(
      {R Function()? loading,
      R Function(Loaded)? loaded,
      R Function()? error,
      required R Function(DevicesPageState) orElse}) {
    switch (this._type) {
      case _DevicesPageState.Loading:
        if (loading == null) break;
        return loading();
      case _DevicesPageState.Loaded:
        if (loaded == null) break;
        return loaded(this as Loaded);
      case _DevicesPageState.Error:
        if (error == null) break;
        return error();
    }
    return orElse(this);
  }

  /// The [whenPartial] method is equivalent to [whenOrElse],
  /// but non-exhaustive.
  void whenPartial(
      {void Function()? loading,
      void Function(Loaded)? loaded,
      void Function()? error}) {
    assert(() {
      if (loading == null && loaded == null && error == null) {
        throw 'provide at least one branch';
      }
      return true;
    }());
    switch (this._type) {
      case _DevicesPageState.Loading:
        if (loading == null) break;
        return loading();
      case _DevicesPageState.Loaded:
        if (loaded == null) break;
        return loaded(this as Loaded);
      case _DevicesPageState.Error:
        if (error == null) break;
        return error();
    }
  }

  @override
  List<Object> get props => const [];
}

@immutable
abstract class Loading extends DevicesPageState {
  const Loading() : super(_DevicesPageState.Loading);

  factory Loading.create() = _LoadingImpl;
}

@immutable
class _LoadingImpl extends Loading {
  const _LoadingImpl() : super();

  @override
  String toString() => 'Loading()';
}

@immutable
abstract class Loaded extends DevicesPageState {
  const Loaded({required this.devices}) : super(_DevicesPageState.Loaded);

  factory Loaded.create({required List<Device> devices}) = _LoadedImpl;

  final List<Device> devices;

  /// Creates a copy of this Loaded but with the given fields
  /// replaced with the new values.
  Loaded copyWith({List<Device> devices});
}

@immutable
class _LoadedImpl extends Loaded {
  const _LoadedImpl({required this.devices}) : super(devices: devices);

  @override
  final List<Device> devices;

  @override
  _LoadedImpl copyWith({Object devices = superEnum}) => _LoadedImpl(
        devices: devices == superEnum ? this.devices : devices as List<Device>,
      );
  @override
  String toString() => 'Loaded(devices: ${this.devices})';
  @override
  List<Object> get props => [devices];
}

@immutable
abstract class Error extends DevicesPageState {
  const Error() : super(_DevicesPageState.Error);

  factory Error.create() = _ErrorImpl;
}

@immutable
class _ErrorImpl extends Error {
  const _ErrorImpl() : super();

  @override
  String toString() => 'Error()';
}
