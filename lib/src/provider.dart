import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

final class LinkTargetProvider extends ChangeNotifier {
  String _linkTarget = '';

  bool get hasTarget => _linkTarget.isNotEmpty;

  String get linkTarget => _linkTarget;

  void onHover(String value) {
    _linkTarget = value;
    log(name: 'LinkTargetProvider', 'onHover: $_linkTarget');
    notifyListeners();
  }

  void onExit(String linkTarget) {
    if (_linkTarget == linkTarget) {
      _linkTarget = '';
    }
    notifyListeners();
  }
}
