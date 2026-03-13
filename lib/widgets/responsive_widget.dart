import 'package:flutter/material.dart';
import 'package:tv_program_manager/styling/sizes.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;
  final bool? useParentWidth;

  const ResponsiveWidget({
    required this.mobile,
    required this.tablet,
    required this.desktop,
    this.useParentWidth,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    if (useParentWidth ?? false) {
      if (screenSize.width < Breakpoints.mobile) {
        return mobile;
      } else if (screenSize.width < Breakpoints.tablet) {
        return tablet;
      } else {
        return desktop;
      }
    } else {
      return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final maxWidth = constraints.maxWidth;
          if (maxWidth < Breakpoints.mobile) {
            return mobile;
          } else if (maxWidth < Breakpoints.tablet) {
            return tablet;
          } else {
            return desktop;
          }
        },
      );
    }
  }
}
