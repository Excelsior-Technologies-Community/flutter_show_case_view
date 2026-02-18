import 'package:flutter/material.dart';

class ShowcaseTarget extends StatelessWidget {
  final GlobalKey showcaseKey;
  final Widget child;

  const ShowcaseTarget({
    super.key,
    required this.showcaseKey,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      key: showcaseKey,
      child: child,
    );
  }
}
