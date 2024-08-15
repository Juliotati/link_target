<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->

# Link Target

[![Tests Pipeline](https://github.com/Juliotati/link_target/actions/workflows/ci_tests_pipeline.yml/badge.svg)](https://github.com/Juliotati/link_target/actions/workflows/ci_tests_pipeline.yml)
[![pub package](https://img.shields.io/pub/v/link_target.svg)](https://pub.dev/packages/link_target)
![License](https://img.shields.io/github/license/Juliotati/link_target)

Adds hyperlink preview behaviour on hover found on browsers.

## Preview

https://github.com/user-attachments/assets/b58f76fb-0e4e-4af5-98ba-2c6d130ade30

## Getting started

Add `link_target` to `pubspec.yaml` of your project:
```sh
dart pub add
```

Import it in your Dart code:
```dart
import 'package:link_target/link_target.dart';
```

- Make sure to wrap your material `home` widget with `LinkTargetRegion`

## Code sample

```dart
import 'package:link_target/link_target.dart';

class MyAppInkwellOrGestureDetector extends StatelessWidget {
  const MyAppInkwellOrGestureDetector({super.key});
  
  @override
  Widget build(BuildContext context) {
    return LinkTargetDetector(
      target: 'https://dart.dev/',
      child: GestureDetector(
        child: Text(
          'Preview dart.dev',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
```

View the demo app in [example](https://github.com/Juliotati/link_target/tree/main/example) directory for complete sample.

## License

Link target is under [MIT license](https://github.com/juliotati/link_target/blob/main/LICENSE)
