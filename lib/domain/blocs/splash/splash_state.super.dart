// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: return_of_invalid_type, constant_identifier_names, prefer_const_constructors_in_immutables, unnecessary_this, sort_unnamed_constructors_first, join_return_with_assignment, missing_return, lines_longer_than_80_chars

part of 'splash_state.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class SplashState extends Equatable {
  const SplashState(this._type);

  factory SplashState.loading() = Loading.create;

  factory SplashState.initialized(
      {@required Scanner scanner,
      @required DevicesRepository devicesRepository,
      @required FlutterReactiveBle ble}) = Initialized.create;

  final _SplashState _type;

  /// The [when] method is the equivalent to pattern matching.
  /// Its prototype depends on the _SplashState [_type]s defined.
  R when<R extends Object>(
      {@required R Function() loading,
      @required R Function(Initialized) initialized}) {
    assert(() {
      if (loading == null || initialized == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _SplashState.Loading:
        return loading();
      case _SplashState.Initialized:
        return initialized(this as Initialized);
    }
  }

  /// The [whenOrElse] method is equivalent to [when], but doesn't require
  /// all callbacks to be specified.
  ///
  /// On the other hand, it adds an extra orElse required parameter,
  /// for fallback behavior.
  R whenOrElse<R extends Object>(
      {R Function() loading,
      R Function(Initialized) initialized,
      @required R Function(SplashState) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _SplashState.Loading:
        if (loading == null) break;
        return loading();
      case _SplashState.Initialized:
        if (initialized == null) break;
        return initialized(this as Initialized);
    }
    return orElse(this);
  }

  /// The [whenPartial] method is equivalent to [whenOrElse],
  /// but non-exhaustive.
  void whenPartial(
      {void Function() loading, void Function(Initialized) initialized}) {
    assert(() {
      if (loading == null && initialized == null) {
        throw 'provide at least one branch';
      }
      return true;
    }());
    switch (this._type) {
      case _SplashState.Loading:
        if (loading == null) break;
        return loading();
      case _SplashState.Initialized:
        if (initialized == null) break;
        return initialized(this as Initialized);
    }
  }

  @override
  List<Object> get props => const [];
}

@immutable
abstract class Loading extends SplashState {
  const Loading() : super(_SplashState.Loading);

  factory Loading.create() = _LoadingImpl;
}

@immutable
class _LoadingImpl extends Loading {
  const _LoadingImpl() : super();

  @override
  String toString() => 'Loading()';
}

@immutable
abstract class Initialized extends SplashState {
  const Initialized(
      {@required this.scanner,
      @required this.devicesRepository,
      @required this.ble})
      : super(_SplashState.Initialized);

  factory Initialized.create(
      {@required Scanner scanner,
      @required DevicesRepository devicesRepository,
      @required FlutterReactiveBle ble}) = _InitializedImpl;

  final Scanner scanner;

  final DevicesRepository devicesRepository;

  final FlutterReactiveBle ble;

  /// Creates a copy of this Initialized but with the given fields
  /// replaced with the new values.
  Initialized copyWith(
      {Scanner scanner,
      DevicesRepository devicesRepository,
      FlutterReactiveBle ble});
}

@immutable
class _InitializedImpl extends Initialized {
  const _InitializedImpl(
      {@required this.scanner,
      @required this.devicesRepository,
      @required this.ble})
      : super(scanner: scanner, devicesRepository: devicesRepository, ble: ble);

  @override
  final Scanner scanner;

  @override
  final DevicesRepository devicesRepository;

  @override
  final FlutterReactiveBle ble;

  @override
  _InitializedImpl copyWith(
          {Object scanner = superEnum,
          Object devicesRepository = superEnum,
          Object ble = superEnum}) =>
      _InitializedImpl(
        scanner: scanner == superEnum ? this.scanner : scanner as Scanner,
        devicesRepository: devicesRepository == superEnum
            ? this.devicesRepository
            : devicesRepository as DevicesRepository,
        ble: ble == superEnum ? this.ble : ble as FlutterReactiveBle,
      );
  @override
  String toString() =>
      'Initialized(scanner: ${this.scanner}, devicesRepository: ${this.devicesRepository}, ble: ${this.ble})';
  @override
  List<Object> get props => [scanner, devicesRepository, ble];
}
