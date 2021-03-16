// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: return_of_invalid_type, constant_identifier_names, prefer_const_constructors_in_immutables, unnecessary_this, sort_unnamed_constructors_first, join_return_with_assignment, missing_return, lines_longer_than_80_chars

part of 'last_device_state.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class LastDeviceState extends Equatable {
  const LastDeviceState(this._type);

  factory LastDeviceState.loading() = Loading.create;

  factory LastDeviceState.loaded({@required Device device}) = Loaded.create;

  factory LastDeviceState.error() = Error.create;

  factory LastDeviceState.empty() = Empty.create;

  final _LastDeviceState _type;

  /// The [when] method is the equivalent to pattern matching.
  /// Its prototype depends on the _LastDeviceState [_type]s defined.
  R when<R extends Object>(
      {@required R Function() loading,
      @required R Function(Loaded) loaded,
      @required R Function() error,
      @required R Function() empty}) {
    assert(() {
      if (loading == null || loaded == null || error == null || empty == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _LastDeviceState.Loading:
        return loading();
      case _LastDeviceState.Loaded:
        return loaded(this as Loaded);
      case _LastDeviceState.Error:
        return error();
      case _LastDeviceState.Empty:
        return empty();
    }
  }

  /// The [whenOrElse] method is equivalent to [when], but doesn't require
  /// all callbacks to be specified.
  ///
  /// On the other hand, it adds an extra orElse required parameter,
  /// for fallback behavior.
  R whenOrElse<R extends Object>(
      {R Function() loading,
      R Function(Loaded) loaded,
      R Function() error,
      R Function() empty,
      @required R Function(LastDeviceState) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _LastDeviceState.Loading:
        if (loading == null) break;
        return loading();
      case _LastDeviceState.Loaded:
        if (loaded == null) break;
        return loaded(this as Loaded);
      case _LastDeviceState.Error:
        if (error == null) break;
        return error();
      case _LastDeviceState.Empty:
        if (empty == null) break;
        return empty();
    }
    return orElse(this);
  }

  /// The [whenPartial] method is equivalent to [whenOrElse],
  /// but non-exhaustive.
  void whenPartial(
      {void Function() loading,
      void Function(Loaded) loaded,
      void Function() error,
      void Function() empty}) {
    assert(() {
      if (loading == null && loaded == null && error == null && empty == null) {
        throw 'provide at least one branch';
      }
      return true;
    }());
    switch (this._type) {
      case _LastDeviceState.Loading:
        if (loading == null) break;
        return loading();
      case _LastDeviceState.Loaded:
        if (loaded == null) break;
        return loaded(this as Loaded);
      case _LastDeviceState.Error:
        if (error == null) break;
        return error();
      case _LastDeviceState.Empty:
        if (empty == null) break;
        return empty();
    }
  }

  @override
  List<Object> get props => const [];
}

@immutable
abstract class Loading extends LastDeviceState {
  const Loading() : super(_LastDeviceState.Loading);

  factory Loading.create() = _LoadingImpl;
}

@immutable
class _LoadingImpl extends Loading {
  const _LoadingImpl() : super();

  @override
  String toString() => 'Loading()';
}

@immutable
abstract class Loaded extends LastDeviceState {
  const Loaded({@required this.device}) : super(_LastDeviceState.Loaded);

  factory Loaded.create({@required Device device}) = _LoadedImpl;

  final Device device;

  /// Creates a copy of this Loaded but with the given fields
  /// replaced with the new values.
  Loaded copyWith({Device device});
}

@immutable
class _LoadedImpl extends Loaded {
  const _LoadedImpl({@required this.device}) : super(device: device);

  @override
  final Device device;

  @override
  _LoadedImpl copyWith({Object device = superEnum}) => _LoadedImpl(
        device: device == superEnum ? this.device : device as Device,
      );
  @override
  String toString() => 'Loaded(device: ${this.device})';
  @override
  List<Object> get props => [device];
}

@immutable
abstract class Error extends LastDeviceState {
  const Error() : super(_LastDeviceState.Error);

  factory Error.create() = _ErrorImpl;
}

@immutable
class _ErrorImpl extends Error {
  const _ErrorImpl() : super();

  @override
  String toString() => 'Error()';
}

@immutable
abstract class Empty extends LastDeviceState {
  const Empty() : super(_LastDeviceState.Empty);

  factory Empty.create() = _EmptyImpl;
}

@immutable
class _EmptyImpl extends Empty {
  const _EmptyImpl() : super();

  @override
  String toString() => 'Empty()';
}
