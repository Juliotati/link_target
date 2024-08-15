import 'package:flutter/material.dart' show MouseRegion, Text, TextDirection;
import 'package:flutter_test/flutter_test.dart';
import 'package:link_target/src/detector.dart';

void main() {
  testWidgets(
    'LinkTargetDetector should be build correctly',
    (tester) async {
      await tester.pumpWidget(
        const LinkTargetDetector(
          target: 'https://example.com',
          child: Text(
            'Click here',
            textDirection: TextDirection.ltr,
          ),
        ),
      );

      expect(find.text('Click here'), findsOneWidget);
      expect(find.byType(MouseRegion), findsOneWidget);
    },
  );
}
