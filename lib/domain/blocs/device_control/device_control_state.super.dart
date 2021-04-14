// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: return_of_invalid_type, constant_identifier_names, prefer_const_constructors_in_immutables, unnecessary_this, sort_unnamed_constructors_first, join_return_with_assignment, missing_return, lines_longer_than_80_chars

part of 'device_control_state.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class DeviceControlState extends Equatable {
  const DeviceControlState(this._type);

  factory DeviceControlState.loading() = Loading.create;

  factory DeviceControlState.loaded() = Loaded.create;

  factory DeviceControlState.error() = Error.create;

  final _DeviceControlState _type;

  /// The [when] method is the equivalent to pattern matching.
  /// Its prototype depends on the _DeviceControlState [_type]s defined.
  R when<R extends Object>(
      {required R Function() loading,
      required R Function() loaded,
      required R Function() error}) {
    switch (this._type) {
      case _DeviceControlState.Loading:
        return loading();
      case _DeviceControlState.Loaded:
        return loaded();
      case _DeviceControlState.Error:
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
      R Function()? loaded,
      R Function()? error,
      required R Function(DeviceControlState) orElse}) {
    switch (this._type) {
      case _DeviceControlState.Loading:
        if (loading == null) break;
        return loading();
      case _DeviceControlState.Loaded:
        if (loaded == null) break;
        return loaded();
      case _DeviceControlState.Error:
        if (error == null) break;
        return error();
    }
    return orElse(this);
  }

  /// The [whenPartial] method is equivalent to [whenOrElse],
  /// but non-exhaustive.
  void whenPartial(
      {void Function()? loading,
      void Function()? loaded,
      void Function()? error}) {
    assert(() {
      if (loading == null && loaded == null && error == null) {
        throw 'provide at least one branch';
      }
      return true;
    }());
    switch (this._type) {
      case _DeviceControlState.Loading:
        if (loading == null) break;
        return loading();
      case _DeviceControlState.Loaded:
        if (loaded == null) break;
        return loaded();
      case _DeviceControlState.Error:
        if (error == null) break;
        return error();
    }
  }

  @override
  List<Object> get props => const [];
}

@immutable
abstract class Loading extends DeviceControlState {
  const Loading() : super(_DeviceControlState.Loading);

  factory Loading.create() = _LoadingImpl;
}

@immutable
class _LoadingImpl extends Loading {
  const _LoadingImpl() : super();

  @override
  String toString() => 'Loading()';
}

@immutable
abstract class Loaded extends DeviceControlState {
  const Loaded() : super(_DeviceControlState.Loaded);

  factory Loaded.create() = _LoadedImpl;
}

@immutable
class _LoadedImpl extends Loaded {
  const _LoadedImpl() : super();

  @override
  String toString() => 'Loaded()';
}

@immutable
abstract class Error extends DeviceControlState {
  const Error() : super(_DeviceControlState.Error);

  factory Error.create() = _ErrorImpl;
}

@immutable
class _ErrorImpl extends Error {
  const _ErrorImpl() : super();

  @override
  String toString() => 'Error()';
}
