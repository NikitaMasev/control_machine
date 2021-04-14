import 'dart:math';

import 'package:control_machine/di/last_device_scope.dart';
import 'package:control_machine/di/splash_scope.dart';
import 'package:control_machine/domain/logs/bloc_logger.dart';
import 'package:control_machine/presentation/pages/home_page.dart';
import 'package:control_machine/presentation/widgets/joypad.dart';
import 'package:control_machine/presentation/widgets/joystick_view.dart';
import 'package:control_machine/presentation/widgets/permission_checker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = BlocLogger();
  runApp(Application());
}

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.black,
      systemNavigationBarIconBrightness: Brightness.light,
    ));
    return MaterialApp(
        title: 'Control Machine',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: TextTheme(
            headline1: TextStyle(
              color: Colors.grey,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        home: TestJoyStick());
  }
}

class TestJoyStick extends StatefulWidget {
  @override
  _TestJoyStickState createState() => _TestJoyStickState();
}

class _TestJoyStickState extends State<TestJoyStick> {
  static const _MAX_VAL_COORDINATE_ARDUINO = 255;

  @override
  Widget build(BuildContext context) {
    final size = min<double>(
      MediaQuery.of(context).size.height,
      MediaQuery.of(context).size.width,
    );
    final maxValCoordinate = size / 2;
    /*return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: JoyPad(
          size: size/2,
          onChange: (offset) {
            print('${offset.dx} ${offset.dy}');
          },
        ),
      ),
    );*/
    print('SIZE $size');
    return Scaffold(
      body: JoystickView(
        size: size,
        onCoordinatesChanged: (x, y) {
          final normalizedX = _normalizeValue(x, maxValCoordinate);
          final normalizedY = _normalizeValue(y, maxValCoordinate);
          print('X $x XN $normalizedX Y $y YN $normalizedY');
        },
      ),
    );
  }

  int _normalizeValue(double val, double maxVal) {
    var normalized = (_MAX_VAL_COORDINATE_ARDUINO * val / maxVal).floor();

    if (normalized > 0 && normalized > _MAX_VAL_COORDINATE_ARDUINO) {
      normalized = _MAX_VAL_COORDINATE_ARDUINO;
    } else if (normalized < 0 && normalized < -_MAX_VAL_COORDINATE_ARDUINO) {
      normalized = -_MAX_VAL_COORDINATE_ARDUINO;
    }
    return normalized;
  }
}

/*PermissionChecker(
child: SplashScope(
child: LastDeviceScope(
child: HomePage(),
),
),
),*/
