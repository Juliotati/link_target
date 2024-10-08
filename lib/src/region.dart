import 'package:flutter/material.dart';
import 'package:link_target/src/platform_widget.dart';
import 'package:link_target/src/provider.dart';
import 'package:provider/provider.dart';

@immutable
final class LinkTargetRegion extends StatelessWidget {
  /// Displays the full URL when a mouse hover is detected on web by the widget
  /// wrapped in [LinkTargetDetector].
  ///
  /// The [child] argument must not be null.
  const LinkTargetRegion({required this.child, super.key});

  /// The widget below [LinkTargetRegion] in the tree.
  ///
  /// This should be directly your apps [MaterialApp] as the child of `home` or
  /// `builder` if in use for the best result.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LinkTargetPlatformWidget(
      onNoRegion: child,
      onApplyRegion: ListenableProvider(
        create: (_) => LinkTargetProvider(),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            child,
            Positioned(
              left: 0.0,
              bottom: 0.0,
              child: Consumer<LinkTargetProvider>(
                builder: (context, provider, _) {
                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    reverseDuration: const Duration(milliseconds: 300),
                    child: !provider.hasTarget
                        ? SizedBox.shrink(key: UniqueKey())
                        : Card(
                            elevation: 0.0,
                            margin: EdgeInsets.zero,
                            color: const Color.fromRGBO(40, 40, 40, 1.0),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(6.0),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 4.0,
                                horizontal: 10.0,
                              ),
                              child: Text(
                                provider.linkTarget,
                                maxLines: 1,
                                softWrap: false,
                                style: const TextStyle(
                                  fontSize: 11.5,
                                  overflow: TextOverflow.ellipsis,
                                  color: Color.fromRGBO(240, 240, 240, 1.0),
                                ),
                              ),
                            ),
                          ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
