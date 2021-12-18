import 'package:flutter/material.dart';
import 'package:india_today/widgets/app_bar.dart';

class MyScaffold extends StatelessWidget {
  final Widget child;
  const MyScaffold({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: child,
    );
  }
}
