import 'package:control_machine/presentation/widgets/loading_indicator.dart';
import 'package:control_machine/presentation/widgets/text_info.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rxdart/rxdart.dart';

class PermissionChecker extends StatefulWidget {
  final Widget child;

  const PermissionChecker({
    required this.child,
  });

  @override
  _PermissionCheckerState createState() => _PermissionCheckerState();
}

class _PermissionCheckerState extends State<PermissionChecker> {
  final _streamStatePermission = BehaviorSubject<PermissionStatus>();

  static const _needPermission = 'Необходимо разрешение для дальнейшей работы.';
  static const _permissionRestricted = 'Разрешение ограничено (restricted),'
      ' проверьте доступные разрешения через настройки.';
  static const _permissionLimited = 'Разрешение ограничено (limited),'
      ' проверьте доступные разрешения через настройки.';

  @override
  void dispose() {
    _streamStatePermission.close();
    super.dispose();
  }

  @override
  void initState() {
    _requestPermissionAndCheck();
    super.initState();
  }

  void _requestPermissionAndCheck() {
    Permission.locationWhenInUse
        .request()
        .then((value) => _streamStatePermission.add(value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: SafeArea(
        child: StreamBuilder<PermissionStatus>(
            stream: _streamStatePermission,
            builder: (ctx, snapshot) {
              if (snapshot.hasData) {
                switch (snapshot.data!) {
                  case PermissionStatus.granted:
                    return widget.child;
                  case PermissionStatus.denied:
                    _requestPermissionAndCheck();
                    return TextInfo(text: _needPermission);
                  case PermissionStatus.restricted:
                    return TextInfo(text: _permissionRestricted);
                  case PermissionStatus.limited:
                    return TextInfo(text: _permissionLimited);
                  case PermissionStatus.permanentlyDenied:
                    _requestPermissionAndCheck();
                    return TextInfo(text: _needPermission);
                }
              }
              return LoadingIndicator();
            }),
      ),
    );
  }
}