import 'package:flutter/material.dart';
import 'package:tv_program_manager/widgets/base_page.dart';
import 'package:tv_program_manager/widgets/tv_show_input.dart';

class ShowsAddPage extends StatelessWidget {
  const ShowsAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: 'Add TV Show',
      body: Center(child: TvShowInput()),
    );
  }
}
