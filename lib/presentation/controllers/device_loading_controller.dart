import 'package:rxdart/rxdart.dart';

class DeviceLoadingController {
  final BehaviorSubject<bool> controller;

  DeviceLoadingController(this.controller);
}