import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:control_machine/data/repositories/devices_repository.dart';
import 'package:control_machine/data/services/ble_connector.dart';
import 'package:control_machine/data/services/ble_scanner.dart';
import 'package:control_machine/data/sources/devices_storage.dart';
import 'package:control_machine/domain/blocs/splash/bloc.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashState.loading());

  @override
  Stream<SplashState> mapEventToState(
    SplashEvent event,
  ) async* {
    yield* event.when(init: _eventInit);
  }

  Stream<SplashState> _eventInit() async* {
    yield SplashState.loading();

    final _shared =  await SharedPreferences.getInstance();
    final _storage = DevicesStorageImpl(_shared);
    final _devicesRepository = DevicesRepositoryImpl(_storage);
    final _ble = FlutterReactiveBle();
    final _scanner = BleScanner(_ble);

    yield SplashState.initialized(
      scanner: _scanner,
      devicesRepository: _devicesRepository,
      ble: _ble
    );
  }
}