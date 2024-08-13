import 'package:flutter/material.dart';
import 'package:link_target/src/provider.dart';
import 'package:provider/provider.dart';

@immutable
final class LinkTargetDetector extends StatefulWidget {
  const LinkTargetDetector({
    required this.child,
    required this.target,
    super.key,
  });

  final Widget child;
  final String target;

  @override
  State<LinkTargetDetector> createState() => _LinkTargetDetectorState();
}

class _LinkTargetDetectorState extends State<LinkTargetDetector> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (_) {
        if (_isHovered) return;
        _isHovered = true;

        final duration = context.read<LinkTargetProvider>().hasTarget
            ? const Duration(milliseconds: 0)
            : const Duration(milliseconds: 550);

        Future.delayed(duration, () {
          if (!(_isHovered && context.mounted)) return;
          context.read<LinkTargetProvider>().onHover(widget.target);
        });
      },
      onExit: (_) {
        Future.delayed(const Duration(milliseconds: 300), () {
          _isHovered = false;
          if (!context.mounted) return;
          context.read<LinkTargetProvider>().onExit(widget.target);
        });
      },
      child: widget.child,
    );
  }
}
