import 'dart:async';

import 'package:control_machine/domain/blocs/devices/bloc.dart';
import 'package:control_machine/presentation/controllers/device_loading_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchDeviceController extends StatefulWidget {
  final Widget child;

  const SearchDeviceController({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  _SearchDeviceControllerState createState() => _SearchDeviceControllerState();
}

class _SearchDeviceControllerState extends State<SearchDeviceController> {
  StreamSubscription _subController;
  DevicesBloc _devicesBloc;

  @override
  void initState() {
    _devicesBloc = context.read<DevicesBloc>();
    _subController = context.read<DeviceLoadingController>().controller.listen(
          (isLoad) => _devicesBloc.add(
            isLoad ? DevicesEvent.search() : DevicesEvent.stopSearch(),
          ),
        );
    super.initState();
  }

  @override
  void dispose() {
    _subController?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
