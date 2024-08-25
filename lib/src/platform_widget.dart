import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:link_target/link_target.dart';

import 'package:link_target/src/helpers/browser_detection.dart'
    if (dart.library.html) 'dart:ui_web';

@immutable
final class LinkTargetPlatformWidget extends StatelessWidget {
  /// Decided whether the overlay should be applied or not depending on the
  /// platform.
  ///
  /// [LinkTargetRegion] should ever only be applied on web browsers with the
  /// exception of web browsers running on mobile devices.
  ///
  /// NOTE: Intended for internal use only.
  const LinkTargetPlatformWidget({
    required this.onNoRegion,
    required this.onApplyRegion,
    super.key,
  });

  final Widget onNoRegion;
  final Widget onApplyRegion;

  @override
  Widget build(BuildContext context) {
    if (!kIsWeb && !Platform.environment.containsKey('FLUTTER_TEST')) {
      return onNoRegion;
    }

    if (BrowserDetection.instance.isMobile) return onNoRegion;

    return onApplyRegion;
  }
}
