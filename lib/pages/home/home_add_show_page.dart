import 'package:flutter/material.dart';
import 'package:tv_program_manager/widgets/tv_show_input.dart';

class HomeAddShowPage extends StatelessWidget {
  const HomeAddShowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add TV Show')),
      body: Center(child: TvShowInput()),
    );
  }
}
