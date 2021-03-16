import 'package:control_machine/data/services/ble_scanner.dart';
import 'package:control_machine/domain/blocs/devices/bloc.dart';
import 'package:control_machine/presentation/widgets/search_device_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchDevicesScope extends StatelessWidget {
  final Widget child;

  const SearchDevicesScope({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => DevicesBloc(context.read<Scanner>())
        ..add(
          DevicesEvent.search(),
        ),
      child: SearchDeviceController(
        child: child,
      ),
    );
  }
}
