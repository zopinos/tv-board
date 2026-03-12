import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:tv_program_manager/controllers/length_controller.dart';
import 'package:tv_program_manager/controllers/tv_show_controller.dart';
import 'package:tv_program_manager/models/tv_show.dart';
import 'package:tv_program_manager/styling/sizes.dart';
import 'package:tv_program_manager/utils/identification.dart';

class TvShowInput extends StatelessWidget {
  TvShowInput({this.showToEdit, super.key});

  final tvShowController = Get.find<TvShowController>();
  final lengthController = Get.find<LengthController>();
  final TvShow? showToEdit;
  static final _formKey = GlobalKey<FormBuilderState>();

  void _submit() {
    if (_formKey.currentState!.saveAndValidate()) {
      DateTime startDate =
          _formKey.currentState!.value['startDate'] ?? DateTime.now();
      DateTime startTime =
          _formKey.currentState!.value['startTime'] ?? DateTime.now();
      DateTime startDateTime = DateTime(
        startDate.year,
        startDate.month,
        startDate.day,
        startTime.hour,
        startTime.minute,
      );
      DateTime endDateTime = startDateTime.add(
        Duration(minutes: int.parse(_formKey.currentState!.value['length'])),
      );
      if (showToEdit != null) {
        TvShow show = TvShow(
          id: showToEdit!.id,
          title: _formKey.currentState!.value['show'],
          channel: _formKey.currentState!.value['channel'],
          startDateTime: startDateTime,
          endDateTime: endDateTime,
          description: _formKey.currentState!.value['description'],
        );

        tvShowController.update(show);
      } else {
        TvShow show = TvShow(
          id: uuid.v4(),
          title: _formKey.currentState!.value['show'],
          channel: _formKey.currentState!.value['channel'],
          startDateTime: startDateTime,
          endDateTime: endDateTime,
          description: _formKey.currentState!.value['description'],
        );

        tvShowController.add(show);
      }

      _formKey.currentState?.reset();

      Get.back();
    }
  }

  void _delete() {
    tvShowController.delete(showToEdit!);
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      initialValue: {
        'show': showToEdit?.title ?? '',
        'channel': showToEdit?.channel ?? '',
        'startDate': showToEdit?.startDateTime ?? DateTime.now(),
        'startTime': showToEdit?.startDateTime ?? DateTime.now(),
        'length':
            showToEdit?.endDateTime
                .difference(showToEdit!.startDateTime)
                .inMinutes
                .toString() ??
            '',
        'description': showToEdit?.description ?? '',
      },
      child: Column(
        children: [
          showToEdit != null
              ? Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: EdgeInsets.all(Margins.defaultMargin),
                    child: ElevatedButton(
                      onPressed: () => _dialogBuilder(context),
                      child: Icon(
                        Icons.delete,
                        color: const Color.fromARGB(255, 255, 81, 69),
                      ),
                    ),
                  ),
                )
              : Container(),
          Container(
            margin: EdgeInsets.all(Margins.defaultMargin),
            child: FormBuilderTextField(
              name: 'show',
              decoration: InputDecoration(
                hintText: 'TV show title',
                border: OutlineInputBorder(),
              ),
              autovalidateMode: AutovalidateMode.always,
              validator: FormBuilderValidators.required(),
            ),
          ),
          Container(
            margin: EdgeInsets.all(Margins.defaultMargin),
            child: FormBuilderTextField(
              name: 'channel',
              decoration: InputDecoration(
                hintText: 'Channel number',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(Margins.defaultMargin),
            child: FormBuilderDateTimePicker(
              name: 'startDate',
              initialDatePickerMode: DatePickerMode.day,
              inputType: InputType.date,
              decoration: InputDecoration(
                labelText: 'TV show start date',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    _formKey.currentState!.fields['startDate']?.didChange(null);
                  },
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(Margins.defaultMargin),
            child: FormBuilderDateTimePicker(
              name: 'startTime',
              timePickerInitialEntryMode: TimePickerEntryMode.inputOnly,
              inputType: InputType.time,
              decoration: InputDecoration(
                labelText: 'TV show start time',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    _formKey.currentState!.fields['startTime']?.didChange(null);
                  },
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(Margins.defaultMargin),
            child: FormBuilderTextField(
              autovalidateMode: AutovalidateMode.always,
              name: 'length',
              decoration: InputDecoration(
                labelText: 'Length (minutes)',
                suffixIcon: lengthController.hasError.value
                    ? const Icon(Icons.error, color: Colors.red)
                    : const Icon(Icons.check, color: Colors.green),
              ),
              onChanged: (val) {
                lengthController.setState(
                  !(_formKey.currentState?.fields['length']?.validate() ??
                      false),
                );
              },
              // valueTransformer: (text) => num.tryParse(text),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                FormBuilderValidators.numeric(),
              ]),
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
            ),
          ),
          Container(
            margin: EdgeInsets.all(Margins.defaultMargin),
            child: FormBuilderTextField(
              name: 'description',
              decoration: InputDecoration(
                hintText: 'Description',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(Margins.defaultMargin),
            child: ElevatedButton(
              onPressed: _submit,
              child: Text(
                showToEdit != null ? "Update TV show" : "Add TV show",
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Delete'),
          content: const Text(
            'Are you sure you want to delete this TV show? This action cannot be undone.',
          ),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () {
                Navigator.of(context).pop();
                _delete();
              },
            ),
          ],
        );
      },
    );
  }
}
