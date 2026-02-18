import 'package:flutter/material.dart';
import '../controller/showcase_controller.dart';
import '../model/showcase_step.dart';
import '../painter/highlight_painter.dart';

class ShowcaseOverlay extends StatefulWidget {
  final ShowcaseStep step;
  final ShowcaseController controller;

  const ShowcaseOverlay({
    super.key,
    required this.step,
    required this.controller,
  });

  @override
  State<ShowcaseOverlay> createState() => _ShowcaseOverlayState();
}

class _ShowcaseOverlayState extends State<ShowcaseOverlay> {
  Rect? targetRect;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => locate());
  }

  void locate() {
    final ctx = widget.step.targetKey.currentContext;
    if (ctx == null) return;

    final box = ctx.findRenderObject() as RenderBox;
    final offset = box.localToGlobal(Offset.zero);

    setState(() {
      targetRect = offset & box.size;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (targetRect == null) return const SizedBox();

    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          CustomPaint(
            size: MediaQuery.of(context).size,
            painter: HighlightPainter(targetRect!, widget.step.shape),
          ),

          Positioned(
            top: targetRect!.bottom + 20,
            left: 20,
            right: 20,
            child: _tooltip(context),
          ),

          Positioned(
            top: 40,
            right: 20,
            child: _skipButton(),
          )
        ],
      ),
    );
  }

  Widget _skipButton() {
    return ElevatedButton(
      onPressed: widget.controller.skip,
      child: const Text("SKIP"),
    );
  }

  Widget _tooltip(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(14),
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(widget.step.title,
                style:
                const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(widget.step.description),
            const SizedBox(height: 12),

            Text(
              "${widget.controller.currentStep}/${widget.controller.totalSteps}",
              style: const TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () =>
                      widget.controller.previous(context),
                  child: const Text("BACK"),
                ),
                ElevatedButton(
                  onPressed: () =>
                      widget.controller.next(context),
                  child: const Text("NEXT"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
