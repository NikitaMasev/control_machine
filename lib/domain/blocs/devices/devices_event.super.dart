// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: return_of_invalid_type, constant_identifier_names, prefer_const_constructors_in_immutables, unnecessary_this, sort_unnamed_constructors_first, join_return_with_assignment, missing_return, lines_longer_than_80_chars

part of 'devices_event.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class DevicesEvent extends Equatable {
  const DevicesEvent(this._type);

  factory DevicesEvent.search() = Search.create;

  factory DevicesEvent.devicesFounded(
      {required List<DiscoveredDevice> devices}) = DevicesFounded.create;

  factory DevicesEvent.stopSearch() = StopSearch.create;

  final _DevicesEvent _type;

  /// The [when] method is the equivalent to pattern matching.
  /// Its prototype depends on the _DevicesEvent [_type]s defined.
  R when<R extends Object>(
      {required R Function() search,
      required R Function(DevicesFounded) devicesFounded,
      required R Function() stopSearch}) {
    switch (this._type) {
      case _DevicesEvent.Search:
        return search();
      case _DevicesEvent.DevicesFounded:
        return devicesFounded(this as DevicesFounded);
      case _DevicesEvent.StopSearch:
        return stopSearch();
    }
  }

  /// The [whenOrElse] method is equivalent to [when], but doesn't require
  /// all callbacks to be specified.
  ///
  /// On the other hand, it adds an extra orElse required parameter,
  /// for fallback behavior.
  R whenOrElse<R extends Object>(
      {R Function()? search,
      R Function(DevicesFounded)? devicesFounded,
      R Function()? stopSearch,
      required R Function(DevicesEvent) orElse}) {
    switch (this._type) {
      case _DevicesEvent.Search:
        if (search == null) break;
        return search();
      case _DevicesEvent.DevicesFounded:
        if (devicesFounded == null) break;
        return devicesFounded(this as DevicesFounded);
      case _DevicesEvent.StopSearch:
        if (stopSearch == null) break;
        return stopSearch();
    }
    return orElse(this);
  }

  /// The [whenPartial] method is equivalent to [whenOrElse],
  /// but non-exhaustive.
  void whenPartial(
      {void Function()? search,
      void Function(DevicesFounded)? devicesFounded,
      void Function()? stopSearch}) {
    assert(() {
      if (search == null && devicesFounded == null && stopSearch == null) {
        throw 'provide at least one branch';
      }
      return true;
    }());
    switch (this._type) {
      case _DevicesEvent.Search:
        if (search == null) break;
        return search();
      case _DevicesEvent.DevicesFounded:
        if (devicesFounded == null) break;
        return devicesFounded(this as DevicesFounded);
      case _DevicesEvent.StopSearch:
        if (stopSearch == null) break;
        return stopSearch();
    }
  }

  @override
  List<Object> get props => const [];
}

@immutable
abstract class Search extends DevicesEvent {
  const Search() : super(_DevicesEvent.Search);

  factory Search.create() = _SearchImpl;
}

@immutable
class _SearchImpl extends Search {
  const _SearchImpl() : super();

  @override
  String toString() => 'Search()';
}

@immutable
abstract class DevicesFounded extends DevicesEvent {
  const DevicesFounded({required this.devices})
      : super(_DevicesEvent.DevicesFounded);

  factory DevicesFounded.create({required List<DiscoveredDevice> devices}) =
      _DevicesFoundedImpl;

  final List<DiscoveredDevice> devices;

  /// Creates a copy of this DevicesFounded but with the given fields
  /// replaced with the new values.
  DevicesFounded copyWith({List<DiscoveredDevice> devices});
}

@immutable
class _DevicesFoundedImpl extends DevicesFounded {
  const _DevicesFoundedImpl({required this.devices}) : super(devices: devices);

  @override
  final List<DiscoveredDevice> devices;

  @override
  _DevicesFoundedImpl copyWith({Object devices = superEnum}) =>
      _DevicesFoundedImpl(
        devices: devices == superEnum
            ? this.devices
            : devices as List<DiscoveredDevice>,
      );
  @override
  String toString() => 'DevicesFounded(devices: ${this.devices})';
  @override
  List<Object> get props => [devices];
}

@immutable
abstract class StopSearch extends DevicesEvent {
  const StopSearch() : super(_DevicesEvent.StopSearch);

  factory StopSearch.create() = _StopSearchImpl;
}

@immutable
class _StopSearchImpl extends StopSearch {
  const _StopSearchImpl() : super();

  @override
  String toString() => 'StopSearch()';
}
