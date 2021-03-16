// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: return_of_invalid_type, constant_identifier_names, prefer_const_constructors_in_immutables, unnecessary_this, sort_unnamed_constructors_first, join_return_with_assignment, missing_return, lines_longer_than_80_chars

part of 'devices_loading_state.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class DevicesLoadingState extends Equatable {
  const DevicesLoadingState(this._type);

  factory DevicesLoadingState.search() = Search.create;

  factory DevicesLoadingState.stop() = Stop.create;

  final _DevicesLoadingState _type;

  /// The [when] method is the equivalent to pattern matching.
  /// Its prototype depends on the _DevicesLoadingState [_type]s defined.
  R when<R extends Object>(
      {@required R Function() search, @required R Function() stop}) {
    assert(() {
      if (search == null || stop == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _DevicesLoadingState.Search:
        return search();
      case _DevicesLoadingState.Stop:
        return stop();
    }
  }

  /// The [whenOrElse] method is equivalent to [when], but doesn't require
  /// all callbacks to be specified.
  ///
  /// On the other hand, it adds an extra orElse required parameter,
  /// for fallback behavior.
  R whenOrElse<R extends Object>(
      {R Function() search,
      R Function() stop,
      @required R Function(DevicesLoadingState) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _DevicesLoadingState.Search:
        if (search == null) break;
        return search();
      case _DevicesLoadingState.Stop:
        if (stop == null) break;
        return stop();
    }
    return orElse(this);
  }

  /// The [whenPartial] method is equivalent to [whenOrElse],
  /// but non-exhaustive.
  void whenPartial({void Function() search, void Function() stop}) {
    assert(() {
      if (search == null && stop == null) {
        throw 'provide at least one branch';
      }
      return true;
    }());
    switch (this._type) {
      case _DevicesLoadingState.Search:
        if (search == null) break;
        return search();
      case _DevicesLoadingState.Stop:
        if (stop == null) break;
        return stop();
    }
  }

  @override
  List<Object> get props => const [];
}

@immutable
abstract class Search extends DevicesLoadingState {
  const Search() : super(_DevicesLoadingState.Search);

  factory Search.create() = _SearchImpl;
}

@immutable
class _SearchImpl extends Search {
  const _SearchImpl() : super();

  @override
  String toString() => 'Search()';
}

@immutable
abstract class Stop extends DevicesLoadingState {
  const Stop() : super(_DevicesLoadingState.Stop);

  factory Stop.create() = _StopImpl;
}

@immutable
class _StopImpl extends Stop {
  const _StopImpl() : super();

  @override
  String toString() => 'Stop()';
}
