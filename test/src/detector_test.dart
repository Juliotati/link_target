import 'package:flutter/material.dart' show MouseRegion, Text, TextDirection;
import 'package:flutter_test/flutter_test.dart';
import 'package:link_target/src/detector.dart';

void main() {
  group('LinkTargetDetector', () {
    testWidgets('should layout MouseRegion and child', (tester) async {
      await tester.pumpWidget(
        const LinkTargetDetector(
          target: 'https://example.com',
          child: Text(
            'Flutter web rocks',
            textDirection: TextDirection.ltr,
          ),
        ),
      );

      expect(find.text('Flutter web rocks'), findsOneWidget);
      expect(find.byType(MouseRegion), findsOneWidget);
    });

    testWidgets('should ignore empty target', (tester) async {
      await tester.pumpWidget(
        const LinkTargetDetector(
          target: '',
          child: Text(
            'Flutter web rocks',
            textDirection: TextDirection.ltr,
          ),
        ),
      );

      expect(find.text('Flutter web rocks'), findsOneWidget);
      expect(find.byType(MouseRegion), findsNothing);
    });

    testWidgets('should ignore "null" string target', (tester) async {
      await tester.pumpWidget(
        const LinkTargetDetector(
          target: 'Null',
          child: Text(
            'Flutter web rocks',
            textDirection: TextDirection.ltr,
          ),
        ),
      );

      expect(find.text('Flutter web rocks'), findsOneWidget);
      expect(find.byType(MouseRegion), findsNothing);
    });

    testWidgets('should ignore null target', (tester) async {
      await tester.pumpWidget(
        const LinkTargetDetector(
          target: null,
          child: Text(
            'Flutter web rocks',
            textDirection: TextDirection.ltr,
          ),
        ),
      );

      expect(find.text('Flutter web rocks'), findsOneWidget);
      expect(find.byType(MouseRegion), findsNothing);
    });
  });
}
