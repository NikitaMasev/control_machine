import 'package:control_machine/di/search_devices_scope.dart';
import 'package:control_machine/domain/blocs/last_device/bloc.dart';
import 'package:control_machine/presentation/controllers/devices_loading_controller.dart';
import 'package:control_machine/presentation/controllers/devices_loading_state.dart';
import 'package:control_machine/presentation/navigation/flow.dart';
import 'package:control_machine/presentation/pages/devices_page.dart';
import 'package:control_machine/presentation/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: DevicesLoadingController(BehaviorSubject<DevicesLoadingState>()),
      child: BlocConsumer<LastDeviceBloc, LastDeviceState>(
        listener: (ctx, state) => state.whenPartial(
          loaded: (s) {
            ctx
                .read<DevicesLoadingController>()
                .controller
                .add(DevicesLoadingState.stop());
            Navigator.of(context)
                .push(
                  RouteFlow.connectAndControlFlow(context, s.device),
                )
                .then((value) => ctx
                    .read<DevicesLoadingController>()
                    .controller
                    .add(DevicesLoadingState.search()));
          },
        ),
        builder: (ctx, state) => state.when(
          loading: () => LoadingIndicator(),
          loaded: (_) => SearchDevicesScope(child: DevicesPage()),
          error: () => SearchDevicesScope(child: DevicesPage()),
          empty: () => SearchDevicesScope(child: DevicesPage()),
        ),
      ),
    );
  }
}
