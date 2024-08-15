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
                        child: Text('Preview flutter repo', style: titleMedium),
                      ),
                      LinkTargetDetector(
                        target: 'https://flutter.dev/development',
                        child: Text('Preview flutter.dev', style: titleMedium),
                      ),
                      LinkTargetDetector(
                        target: 'https://dart.dev/',
                        child: Text('Preview dart.dev', style: titleMedium),
                      ),
                      LinkTargetDetector(
                        target: 'https://www.youtube.com/@flutterdev',
                        child:
                            Text('Preview Flutter YouTube', style: titleMedium),
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
