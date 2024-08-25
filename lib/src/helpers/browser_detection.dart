class BrowserDetection {
  BrowserDetection._();

  static final BrowserDetection instance = BrowserDetection._();

  /// Returns the User Agent of the current browser.
  ///
  /// This is made available for testing purposes and to enable the option of
  /// disabling [LinkTargetRegion] on browser on mobile without breaking other
  /// non web platform.
  bool get isMobile => false;
}
