import 'package:flutter/material.dart';
import '../model/showcase_step.dart';
import '../overlay/showcase_overlay.dart';

class ShowcaseController {
  OverlayEntry? _overlayEntry;
  int _currentStep = 0;
  late List<ShowcaseStep> _steps;

  int get currentStep => _currentStep + 1;
  int get totalSteps => _steps.length;

  void start(BuildContext context, List<ShowcaseStep> steps) {
    _steps = steps;
    _currentStep = 0;
    _show(context);
  }

  void next(BuildContext context) {
    if (_currentStep < _steps.length - 1) {
      _currentStep++;
      _refresh(context);
    } else {
      dismiss();
    }
  }

  void previous(BuildContext context) {
    if (_currentStep > 0) {
      _currentStep--;
      _refresh(context);
    }
  }

  void skip() {
    dismiss();
  }

  void dismiss() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  void _refresh(BuildContext context) {
    _overlayEntry?.remove();
    _show(context);
  }

  void _show(BuildContext context) {
    _overlayEntry = OverlayEntry(
      builder: (_) => ShowcaseOverlay(
        step: _steps[_currentStep],
        controller: this,
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }
}
