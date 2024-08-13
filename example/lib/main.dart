import 'package:flutter/material.dart';
import 'package:link_target/link_target.dart';

void main() {
  runApp(const LinkTargetExample());
}

class LinkTargetExample extends StatelessWidget {
  const LinkTargetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Link Target Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LinkTargetRegion(
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                LinkTargetDetector(
                  target: 'https://github.com/flutter/flutter',
                  child: Text(
                    'Preview flutter repo',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                LinkTargetDetector(
                  target: 'https://flutter.dev/development',
                  child: Text(
                    'Preview flutter.dev',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                LinkTargetDetector(
                  target: 'https://dart.dev/',
                  child: Text(
                    'Preview dart.dev',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                LinkTargetDetector(
                  target: 'https://www.youtube.com/@flutterdev',
                  child: Text(
                    'Preview Flutter YouTube',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
