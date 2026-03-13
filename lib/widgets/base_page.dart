import 'package:flutter/material.dart';
import 'package:tv_program_manager/widgets/base_page_desktop.dart';
import 'package:tv_program_manager/widgets/base_page_mobile.dart';
import 'package:tv_program_manager/widgets/responsive_widget.dart';

class BasePage extends StatelessWidget {
  const BasePage({required this.body, required this.title, super.key});

  final Widget body;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      mobile: BasePageMobile(body: body, title: title),
      tablet: BasePageMobile(body: body, title: title),
      desktop: BasePageDesktop(body: body, title: title),
    );
  }
}
