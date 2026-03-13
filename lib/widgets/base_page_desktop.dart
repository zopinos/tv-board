import 'package:flutter/material.dart';
import 'package:tv_program_manager/styling/sizes.dart';
import 'package:tv_program_manager/widgets/tv_bottom_navigation_bar.dart';

class BasePageDesktop extends StatelessWidget {
  const BasePageDesktop({required this.body, required this.title, super.key});

  final Widget body;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: SizedBox(width: Widths.maxWidth, child: body),
      ),
      bottomNavigationBar: TvBottomNavigationBar(),
    );
  }
}
