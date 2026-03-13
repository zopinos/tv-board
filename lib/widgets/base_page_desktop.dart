import 'package:flutter/material.dart';
import 'package:tv_program_manager/styling/sizes.dart';
import 'package:tv_program_manager/widgets/tv_navigation_rail.dart';

class BasePageDesktop extends StatelessWidget {
  const BasePageDesktop({required this.body, required this.title, super.key});

  final Widget body;
  final String title;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.surfaceContainer,
        title: Text(title),
      ),
      body: Center(
        child: Row(
          children: [
            TvNavigationRail(),
            Expanded(
              child: Center(
                child: SizedBox(
                  width: Widths.maxWidth,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: Paddings.largePadding,
                    ),
                    child: body,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
