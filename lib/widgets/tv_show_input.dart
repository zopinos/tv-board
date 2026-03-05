import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:tv_program_manager/controllers/tv_show_controller.dart';
import 'package:tv_program_manager/models/tv_show.dart';
import 'package:tv_program_manager/utils/identification.dart';

class TvShowInput extends StatelessWidget {
  final tvShowController = Get.find<TvShowController>();
  final TvShow? showToEdit;
  static final _formKey = GlobalKey<FormBuilderState>();

  TvShowInput({this.showToEdit});

  _submit() {
    if (_formKey.currentState!.saveAndValidate()) {
      if (showToEdit != null) {
        TvShow show = TvShow(
          showToEdit!.id,
          _formKey.currentState!.value['show'],
          _formKey.currentState!.value['channel'],
        );

        tvShowController.update(show);
      } else {
        TvShow show = TvShow(
          uuid.v4(),
          _formKey.currentState!.value['show'],
          _formKey.currentState!.value['channel'],
        );

        tvShowController.add(show);
      }

      _formKey.currentState?.reset();

      Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      initialValue: {
        'show': showToEdit?.title ?? '',
        'channel': showToEdit?.channel ?? '',
      },
      child: Column(
        children: [
          FormBuilderTextField(
            name: 'show',
            decoration: InputDecoration(
              hintText: 'TV show title',
              border: OutlineInputBorder(),
            ),
            autovalidateMode: AutovalidateMode.always,
            validator: FormBuilderValidators.required(),
          ),
          /*
          FormBuilderTextField(
            name: 'description',
            decoration: InputDecoration(
              hintText: 'Description',
              border: OutlineInputBorder(),
            ),
          ),*/
          /*
          FormBuilderDateTimePicker(
            name: 'date',
            timePickerInitialEntryMode: TimePickerEntryMode.inputOnly,
            initialValue: DateTime.now(),
            inputType: InputType.time,
            decoration: InputDecoration(
              labelText: 'TV show start time',
              suffixIcon: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  _formKey.currentState!.fields['date']?.didChange(null);
                },
              ),
            ),
            initialTime: const TimeOfDay(hour: 8, minute: 0),
            // locale: const Locale.fromSubtags(languageCode: 'fr'),
          ),*/
          FormBuilderTextField(
            name: 'channel',
            decoration: InputDecoration(
              hintText: 'Channel number',
              border: OutlineInputBorder(),
            ),
          ),
          ElevatedButton(
            onPressed: _submit,
            child: Text(showToEdit != null ? "Update TV show" : "Add TV show"),
          ),
        ],
      ),
    );
  }
}
