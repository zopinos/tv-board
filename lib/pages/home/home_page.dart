import 'package:flutter/material.dart';
import 'package:tv_program_manager/widgets/base_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: 'Home',
      body: Center(
        child: Column(children: [Text("Next up"), Text("Compact analytics")]),
      ),
    );
  }
}
