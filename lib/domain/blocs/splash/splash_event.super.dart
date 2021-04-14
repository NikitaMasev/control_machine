// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: return_of_invalid_type, constant_identifier_names, prefer_const_constructors_in_immutables, unnecessary_this, sort_unnamed_constructors_first, join_return_with_assignment, missing_return, lines_longer_than_80_chars

part of 'splash_event.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class SplashEvent extends Equatable {
  const SplashEvent(this._type);

  factory SplashEvent.init() = Init.create;

  final _SplashEvent _type;

  /// The [when] method is the equivalent to pattern matching.
  /// Its prototype depends on the _SplashEvent [_type]s defined.
  R when<R extends Object>({required R Function() init}) {
    switch (this._type) {
      case _SplashEvent.Init:
        return init();
    }
  }

  /// The [whenOrElse] method is equivalent to [when], but doesn't require
  /// all callbacks to be specified.
  ///
  /// On the other hand, it adds an extra orElse required parameter,
  /// for fallback behavior.
  R whenOrElse<R extends Object>(
      {R Function()? init, required R Function(SplashEvent) orElse}) {
    switch (this._type) {
      case _SplashEvent.Init:
        if (init == null) break;
        return init();
    }
    return orElse(this);
  }

  /// The [whenPartial] method is equivalent to [whenOrElse],
  /// but non-exhaustive.
  void whenPartial({void Function()? init}) {
    assert(() {
      if (init == null) {
        throw 'provide at least one branch';
      }
      return true;
    }());
    switch (this._type) {
      case _SplashEvent.Init:
        if (init == null) break;
        return init();
    }
  }

  @override
  List<Object> get props => const [];
}

@immutable
abstract class Init extends SplashEvent {
  const Init() : super(_SplashEvent.Init);

  factory Init.create() = _InitImpl;
}

@immutable
class _InitImpl extends Init {
  const _InitImpl() : super();

  @override
  String toString() => 'Init()';
}
