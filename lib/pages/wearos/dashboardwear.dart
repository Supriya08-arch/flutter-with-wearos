import 'package:flutter/material.dart';
import 'package:wear/wear.dart';

class Dashboardwear extends StatefulWidget {
  const Dashboardwear({Key? key}) : super(key: key);

  @override
  State<Dashboardwear> createState() => _DashboardwearState();
}

class _DashboardwearState extends State<Dashboardwear> {
  @override
  Widget build(BuildContext context) {
    return WatchShape(
        builder: (BuildContext context, WearShape shape, Widget? child) {
      return AmbientMode(builder: (context, mode, child) {
        return const Scaffold(
          body: Center(
            child: Text("welcome to Dashboard"),
          ),
        );
      });
    });
  }
}
