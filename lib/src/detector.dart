import 'package:flutter/material.dart';
import 'package:link_target/src/platform_widget.dart';
import 'package:link_target/src/provider.dart';
import 'package:provider/provider.dart';

@immutable
final class LinkTargetDetector extends StatefulWidget {
  /// Creates a widget that detects when the mouse hovers over the child.
  ///
  /// [child] argument must not be null.
  /// [target] is required but can be null.
  const LinkTargetDetector({
    required this.child,
    required this.target,
    super.key,
  });

  /// The widget below [LinkTargetDetector] in the tree.
  ///
  /// This would usually be your apps' common [GestureDetector] or [InkWell].
  final Widget child;

  /// The target URL to be displayed by [LinkTargetRegion] at the bottom of the
  /// screen on hover.
  ///
  /// Null or empty strings are ignored.
  final String? target;

  @override
  State<LinkTargetDetector> createState() => _LinkTargetDetectorState();
}

class _LinkTargetDetectorState extends State<LinkTargetDetector> {
  bool _isHovered = false;

  String get target => widget.target ?? '';

  String get comparableTarget => target.trim().toLowerCase();

  @override
  Widget build(BuildContext context) {
    if (comparableTarget.isEmpty || comparableTarget == 'null') {
      return widget.child;
    }

    return LinkTargetPlatformWidget(
      onNoRegion: widget.child,
      onApplyRegion: MouseRegion(
        onHover: (_) {
          if (_isHovered) return;
          _isHovered = true;

          final duration = context.read<LinkTargetProvider>().hasTarget
              ? const Duration(milliseconds: 0)
              : const Duration(milliseconds: 550);

          Future.delayed(duration, () {
            if (!(_isHovered && context.mounted)) return;
            context.read<LinkTargetProvider>().onHover(target);
          });
        },
        onExit: (_) {
          Future.delayed(const Duration(milliseconds: 300), () {
            _isHovered = false;
            if (!context.mounted) return;
            context.read<LinkTargetProvider>().onExit(target);
          });
        },
        child: widget.child,
      ),
    );
  }
}
