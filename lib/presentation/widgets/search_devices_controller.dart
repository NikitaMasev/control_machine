import 'dart:async';

import 'package:control_machine/domain/blocs/devices/bloc.dart';
import 'package:control_machine/presentation/controllers/devices_loading_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchDevicesController extends StatefulWidget {
  final Widget child;

  const SearchDevicesController({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  _SearchDevicesControllerState createState() => _SearchDevicesControllerState();
}

class _SearchDevicesControllerState extends State<SearchDevicesController> {
  StreamSubscription _subController;
  DevicesBloc _devicesBloc;

  @override
  void initState() {
    _devicesBloc = context.read<DevicesBloc>();
    _subController = context.read<DevicesLoadingController>().controller.listen(
          (state) => state.whenPartial(
            search: () => _devicesBloc.add(DevicesEvent.search()),
            stop: () => _devicesBloc.add(DevicesEvent.stopSearch()),
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
