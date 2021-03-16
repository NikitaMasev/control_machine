import 'package:control_machine/presentation/controllers/devices_loading_state.dart';
import 'package:rxdart/rxdart.dart';

class DevicesLoadingController {
  final BehaviorSubject<DevicesLoadingState> controller;

  DevicesLoadingController(this.controller);
}
