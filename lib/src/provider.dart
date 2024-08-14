import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Manages and provides link target displayed by [LinkTargetRegion].
final class LinkTargetProvider extends ChangeNotifier {
  String _linkTarget = '';

  /// Returns true if the [linkTarget] is not empty. Meaning there is an actual
  /// target "URL" that has been hovered on.
  bool get hasTarget => _linkTarget.isNotEmpty;

  /// The target "URL" shown on the page by [LinkTargetRegion]
  String get linkTarget => _linkTarget;

  /// Updates the target "URL" shown on the page by [LinkTargetRegion]
  void onHover(String value) {
    _linkTarget = value.trim();
    notifyListeners();
  }

  /// Removes the target "URL" shown on the page by [LinkTargetRegion].
  ///
  /// [linkTarget] should not be cleared if [target] happens to be from it
  /// because the user has already entered a new [LinkTargetDetector].
  void onExit(String target) {
    if (_linkTarget == target) {
      _linkTarget = '';
    }
    notifyListeners();
  }
}
