import 'package:flutter/material.dart';
import 'package:tv_program_manager/widgets/tv_bottom_navigation_bar.dart';

class BasePage extends StatelessWidget {
  const BasePage({required this.body, required this.title, super.key});

  final Widget body;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: body,
      bottomNavigationBar: TvBottomNavigationBar(),
    );
  }
}
