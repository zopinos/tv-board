import 'package:flutter/material.dart';
import 'package:tv_program_manager/widgets/base_page.dart';

class AnalyticsPage extends StatelessWidget {
  const AnalyticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: 'Analytics',
      body: Center(child: Text('Analytics View')),
    );
  }
}
