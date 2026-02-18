import 'package:flutter/material.dart';

enum ShowcaseShape { circle, rectangle }

class ShowcaseStep {
  final GlobalKey targetKey;
  final String title;
  final String description;
  final ShowcaseShape shape;

  ShowcaseStep({
    required this.targetKey,
    required this.title,
    required this.description,
    this.shape = ShowcaseShape.circle,
  });
}
