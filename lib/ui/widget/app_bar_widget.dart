import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
    required this.action,
    required this.leading,
    required this.heading,
  });

  final Widget action;
  final Widget leading;
  final Widget heading;

  @override
  Widget build(BuildContext context) {
    return AppBar(actions: []);
  }
}
