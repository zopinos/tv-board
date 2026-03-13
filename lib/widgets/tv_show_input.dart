import 'package:flutter/material.dart';
import 'package:tv_program_manager/models/tv_show.dart';
import 'package:tv_program_manager/widgets/responsive_widget.dart';
import 'package:tv_program_manager/widgets/tv_show_input_desktop.dart';
import 'package:tv_program_manager/widgets/tv_show_input_mobile.dart';

class TvShowInput extends StatelessWidget {
  const TvShowInput({this.showToEdit, super.key});

  final TvShow? showToEdit;

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      mobile: TvShowInputMobile(showToEdit: showToEdit),
      tablet: TvShowInputMobile(showToEdit: showToEdit),
      desktop: TvShowInputDesktop(showToEdit: showToEdit),
    );
  }
}
