import 'package:control_machine/di/last_device_scope.dart';
import 'package:control_machine/di/splash_scope.dart';
import 'package:control_machine/domain/logs/bloc_logger.dart';
import 'package:control_machine/presentation/pages/home_page.dart';
import 'package:control_machine/presentation/widgets/permission_checker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = BlocLogger();
  runApp(Application());
}

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Control Machine',
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
      home: PermissionChecker(
        child: SplashScope(
          child: LastDeviceScope(
            child: HomePage(),
          ),
        ),
      ),
    );
  }
}
