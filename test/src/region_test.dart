import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart' show Card, MaterialApp, Scaffold, Text;
import 'package:flutter_test/flutter_test.dart';
import 'package:link_target/link_target.dart';

void main() {
  group('LinkTargetRegion', () {
    Future<void> hasPositionedAndAnimatedSwitchWidget() async {
      final positioned = find
          .ancestor(of: find.byType(Stack), matching: find.byType(Positioned))
          .evaluate()
          .first
          .widget as Positioned;

      expect(positioned.left, 0.0);
      expect(positioned.bottom, 0.0);
      expect(positioned.top, isNull);
      expect(positioned.right, isNull);
      expect(positioned.width, isNull);
      expect(positioned.height, isNull);

      final switcher = find.byType(AnimatedSwitcher).evaluate().first.widget
          as AnimatedSwitcher;

      expect(switcher.duration, const Duration(milliseconds: 200));
      expect(switcher.reverseDuration, const Duration(milliseconds: 300));
    }

    Future<({Rect rect, TestGesture gesture})> hoverOnText(
      WidgetTester tester,
      String text,
    ) async {
      final textRect = tester.getRect(find.text(text));
      final gesture = await tester.startGesture(
        textRect.topCenter,
        kind: PointerDeviceKind.mouse,
      );

      await gesture.up();
      await gesture.moveTo(textRect.topLeft);
      await tester.pumpAndSettle(const Duration(milliseconds: 550));

      return (rect: textRect, gesture: gesture);
    }

    testWidgets('should layout empty sizedBox', (tester) async {
      await tester.pumpWidget(const LinkTargetExample());

      await hasPositionedAndAnimatedSwitchWidget();

      expect(find.byType(SizedBox), findsOneWidget);
      expect(find.byType(Card), findsNothing);
    });

    testWidgets('should layout link target content', (tester) async {
      await tester.pumpWidget(const LinkTargetExample());

      await hasPositionedAndAnimatedSwitchWidget();
      await hoverOnText(tester, 'Preview flutter repo');

      final card = find.byType(Card).evaluate().first.widget as Card;

      expect(find.byType(SizedBox), findsNothing);
      expect(card.elevation, 0.0);
      expect(card.margin, EdgeInsets.zero);
      expect(card.color, const Color.fromRGBO(40, 40, 40, 1.0));
      expect(
        card.shape,
        const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topRight: Radius.circular(6.0)),
        ),
      );
      expect(
        (card.child as Padding).padding,
        const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
      );

      final text = (card.child as Padding).child as Text;

      expect(text.data, 'https://github.com/flutter/flutter');
      expect(text.maxLines, 1);
      expect(text.softWrap, isFalse);
      expect(
        text.style,
        const TextStyle(
          fontSize: 12,
          color: Color.fromRGBO(240, 240, 240, 1.0),
        ),
      );
    });

    testWidgets('should hover and exit single widget', (tester) async {
      await tester.pumpWidget(const LinkTargetExample());

      expect(find.text('https://github.com/flutter/flutter'), findsNothing);

      // 1. Hovers on a single widget
      final hover = await hoverOnText(tester, 'Preview flutter repo');

      expect(find.text('https://github.com/flutter/flutter'), findsOneWidget);

      // 2. Exits hover mode and moves away from all widgets
      await hover.gesture.moveTo(const Offset(0.0, 0.0));
      await tester.pumpAndSettle(const Duration(milliseconds: 300));

      expect(find.text('https://github.com/flutter/flutter'), findsNothing);
    });

    testWidgets('should hover on multiple widgets at a time', (tester) async {
      await tester.pumpWidget(const LinkTargetExample());
      expect(find.text('https://github.com/flutter/flutter'), findsNothing);

      // 1. Hovers on the first widget
      final hover = await hoverOnText(tester, 'Preview flutter repo');

      expect(find.text('https://github.com/flutter/flutter'), findsOneWidget);
      expect(find.text('https://flutter.dev/development'), findsNothing);

      // 2. Exits first widget and hovers on the second widget
      await hover.gesture.moveTo(hover.rect.bottomLeft);
      await tester.pumpAndSettle(const Duration(milliseconds: 300));

      expect(find.text('https://github.com/flutter/flutter'), findsNothing);
      expect(find.text('https://flutter.dev/development'), findsOneWidget);

      // 3. Exits hover mode and moves away from all widgets
      await hover.gesture.down(const Offset(0.0, 0.0));
      await hover.gesture.cancel();
      await tester.pumpAndSettle(const Duration(milliseconds: 300));

      expect(find.text('https://github.com/flutter/flutter'), findsNothing);
      expect(find.text('https://flutter.dev/development'), findsNothing);
    });
  });
}

class LinkTargetExample extends StatelessWidget {
  const LinkTargetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Link Target Example',
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
                  child: Text('Preview flutter repo'),
                ),
                LinkTargetDetector(
                  target: 'https://flutter.dev/development',
                  child: Text('Preview flutter.dev'),
                ),
                LinkTargetDetector(
                  target: 'https://dart.dev/',
                  child: Text('Preview dart.dev'),
                ),
                LinkTargetDetector(
                  target: 'https://www.youtube.com/@flutterdev',
                  child: Text('Preview Flutter YouTube'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
