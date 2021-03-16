import 'dart:async';

import 'package:control_machine/domain/blocs/devices/bloc.dart';
import 'package:control_machine/presentation/controllers/devices_loading_controller.dart';
import 'package:control_machine/presentation/controllers/devices_loading_state.dart';
import 'package:control_machine/presentation/models/devices_page_state.dart';
import 'package:control_machine/presentation/widgets/devices.dart';
import 'package:control_machine/presentation/widgets/error_form.dart';
import 'package:control_machine/presentation/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

class DevicesPage extends StatefulWidget {
  static const _notFoundedDevices = 'Не удалось получить список устройств';

  @override
  _DevicesPageState createState() => _DevicesPageState();
}

class _DevicesPageState extends State<DevicesPage> {
  final _streamStatePage = PublishSubject<DevicesPageState>();
  DevicesBloc _devicesBloc;
  StreamSubscription _subBloc;
  StreamSubscription _subLoadingController;

  @override
  void initState() {
    _devicesBloc = context.read<DevicesBloc>();
    _subBloc = _devicesBloc.listen((state) => state.whenPartial(
          loading: () => _streamStatePage.add(DevicesPageState.loading()),
          loaded: (s) =>
              _streamStatePage.add(DevicesPageState.loaded(devices: s.devices)),
          error: () => _streamStatePage.add(DevicesPageState.error()),
        ));
    _subLoadingController = context
        .read<DevicesLoadingController>()
        .controller
        .listen((value) => value.whenPartial(search: () {
              //_devicesBloc.add(DevicesEvent.search());
              //_streamStatePage.add(DevicesPageState.loading());
              _devicesBloc.add(DevicesEvent.search());
            }, stop: () {
              _devicesBloc.add(DevicesEvent.stopSearch());
              _streamStatePage.add(DevicesPageState.loading());
            }));
    super.initState();
  }

  @override
  void dispose() {
    _subBloc?.cancel();
    _subLoadingController?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DevicesPageState>(
        stream: _streamStatePage,
        builder: (ctx, snapshot) {
          if (snapshot.hasData) {
            return snapshot.data.when(
              loading: ()=>LoadingIndicator(),
              loaded: (s) => Devices(devices: s.devices, pagePushed: () {
                context
                    .read<DevicesLoadingController>()
                    .controller
                    .add(DevicesLoadingState.stop());
              }, pagePopped: () {
                context
                    .read<DevicesLoadingController>()
                    .controller
                    .add(DevicesLoadingState.search());
              },),
              error: () => ErrorForm(
                error: DevicesPage._notFoundedDevices,
                retry: () => ctx.read<DevicesBloc>().add(DevicesEvent.search()),
              ),
            );
          }
          return LoadingIndicator();
        });
  }
}
