import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tv_program_manager/models/tv_show.dart';
import 'package:tv_program_manager/widgets/tv_show_input.dart';

class HomeEditShowPage extends StatelessWidget {
  const HomeEditShowPage({super.key});

  @override
  Widget build(BuildContext context) {
    final uri = Uri.parse(Get.currentRoute);
    print(uri.pathSegments);
    final id = uri.pathSegments[2];
    final title = uri.pathSegments[3];
    final channel = uri.pathSegments[4];
    print('showId: $id, showTitle: $title, showChannel: $channel');
    var showToEdit = TvShow(id, title, channel);
    return Scaffold(
      appBar: AppBar(title: const Text('Edit TV Show')),
      body: Center(child: TvShowInput(showToEdit: showToEdit)),
    );
  }
}
