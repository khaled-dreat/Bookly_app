import 'package:flutter/material.dart';

class AppRestart extends StatefulWidget {
  const AppRestart({super.key, required this.child});
  final Widget child;
  @override
  State<AppRestart> createState() => _AppRestartState();
  static void reBuild(BuildContext context) =>
      context.findAncestorStateOfType<_AppRestartState>()?.reStartKey();
}

class _AppRestartState extends State<AppRestart> {
  Key key = UniqueKey();

  // * reStart key
  void reStartKey() {
    key = UniqueKey();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(key: key, child: widget.child);
  }
}
