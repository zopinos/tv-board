import 'package:flutter/material.dart';
import 'package:tv_program_manager/widgets/base_page_mobile.dart';

class AnalyticsPage extends StatelessWidget {
  const AnalyticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePageMobile(
      title: 'Analytics',
      body: Center(child: Text('Analytics View')),
    );
  }
}
