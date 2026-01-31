import 'package:flutter/material.dart';
import 'package:hamewari/l10n/calendar/calendar_localizations.dart';
import 'package:hamewari/main.dart';
import 'package:hamewari/ui/custom_bottom_sheet.dart';
import 'package:hamewari/ui/form/fields/alert_select.dart';
import 'package:hamewari/ui/form/fields/date_picker.dart';
import 'package:hamewari/ui/form/fields/switch.dart';
import 'package:hamewari/ui/form/fields/text.dart';
import 'package:hamewari/ui/separator.dart';

final _formKey = GlobalKey<FormState>();

class AddEventForm extends StatelessWidget {
  const AddEventForm({super.key, required this.onClose});

  final void Function() onClose;

  void _onSubmit() {
    if (_formKey.currentState!.validate()) {
      // TODO: onSubmit?.call();
      debugPrint("onSubmit");
    }
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = context.appTheme;
    final t = CalendarLocalizations.of(context)!;

    return CustomBottomSheet(
      onClose: onClose,
      title: t.new_event_title,
      isSubmittable: true,
      onSubmit: _onSubmit,
      child: Form(
        key: _formKey,
        child: Column(
          spacing: 32.0,
          children: [
            Container(
              decoration: BoxDecoration(
                color: appTheme.highlightedBackgroundColor,
                borderRadius: BorderRadius.circular(16.0),
                border: BoxBorder.all(color: appTheme.borderColor),
              ),
              child: Column(
                children: [
                  // title
                  FormTextField(
                    hint: t.new_event_caption_title,
                    maxLength: 128,
                    autofocus: true,
                    style: appTheme.h5,
                  ),
                  const Separator(),
                  // description
                  FormTextField(
                    hint: t.new_event_caption_description,
                    maxLength: 512,
                    minLines: 2,
                    maxLines: 4,
                    displayCounter: true,
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: appTheme.highlightedBackgroundColor,
                borderRadius: BorderRadius.circular(16.0),
                border: BoxBorder.all(color: appTheme.borderColor),
              ),
              child: Column(
                children: [
                  FormSwitchField(label: t.new_event_caption_all_day),
                  const Separator(),
                  FormDatePickerField(label: t.new_event_caption_start),
                  const Separator(),
                  FormDatePickerField(
                    label: t.new_event_caption_end,
                    isEndDate: true,
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: appTheme.highlightedBackgroundColor,
                borderRadius: BorderRadius.circular(16.0),
                border: BoxBorder.all(color: appTheme.borderColor),
              ),
              child: const FormAlertSelectField(),
            ),
            Container(
              decoration: BoxDecoration(
                color: appTheme.highlightedBackgroundColor,
                borderRadius: BorderRadius.circular(16.0),
                border: BoxBorder.all(color: appTheme.borderColor),
              ),
              child: FormTextField(
                hint: t.new_event_caption_notes,
                maxLength: 1028,
                minLines: 5,
                maxLines: 20,
                displayCounter: true,
              ),
            ),
            SizedBox.fromSize(size: const Size.fromHeight(32.0)),
          ],
        ),
      ),
    );
  }
}
