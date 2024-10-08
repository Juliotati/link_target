import 'package:flutter/material.dart';
import 'package:link_target/link_target.dart';

void main() {
  runApp(const LinkTargetExample());
}

class LinkTargetExample extends StatelessWidget {
  const LinkTargetExample({super.key});

  @override
  Widget build(BuildContext context) {
    final titleMedium = Theme.of(context).textTheme.titleMedium;
    return MaterialApp(
      title: 'Link Target Example',
      home: LinkTargetRegion(
        child: Scaffold(
          body: Center(
            child: Stack(
              children: [
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      LinkTargetDetector(
                        target: 'https://github.com/flutter/flutter',
                        child: Text(
                          'Glance flutter\'s repo link',
                          style: titleMedium,
                        ),
                      ),
                      LinkTargetDetector(
                        target: 'https://flutter.dev/development',
                        child: Text(
                          'Glance flutter.dev\'s link',
                          style: titleMedium,
                        ),
                      ),
                      LinkTargetDetector(
                        target: 'https://dart.dev/',
                        child: Text(
                          'Glance dart.dev\'s link',
                          style: titleMedium,
                        ),
                      ),
                      LinkTargetDetector(
                        target: 'https://www.youtube.com/@flutterdev',
                        child: Text(
                          'Glance Flutter YouTube\'s link',
                          style: titleMedium,
                        ),
                      ),
                    ],
                  ),
                ),
                const Positioned(
                  left: 10.0,
                  bottom: 10.0,
                  child: Icon(Icons.arrow_downward, size: 150.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
