import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:read_me/core/utils/extension/date_time_extention.dart';

import '../../../colors/colors.dart';
import '../textfield/a_text_field.dart';

// ignore: must_be_immutable
class AMonthPicker extends StatefulWidget {
  String name;
  String hintText;
  bool isEnabled;
  bool isRequired;
  String? labelText;
  String? helperText;
  String? errorText;
  String? dateFormat;
  FocusNode? focusNode;
  GlobalKey<FormBuilderState>? formKey;
  Widget? prefixIcon;
  Widget? suffixIcon;
  String? Function(String?)? onValidate;
  Function(String?)? onSaved;
  Function(DateTime?)? onChange;

  AMonthPicker({
    Key? key,
    required this.name,
    required this.hintText,
    this.isEnabled = true,
    this.isRequired = false,
    this.labelText,
    this.helperText,
    this.errorText,
    this.dateFormat,
    this.focusNode,
    this.formKey,
    this.prefixIcon,
    this.suffixIcon,
    this.onValidate,
    this.onChange,
    this.onSaved,
  }) : super(key: key) {
    suffixIcon = suffixIcon ??
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
                color: AppColors.gray.shade100,
                borderRadius: BorderRadius.circular(20)),
            child: const Icon(
              LucideIcons.calendar,
              size: 18,
            ),
          ),
        );
    dateFormat = dateFormat ?? 'dd MMM yyyy';
  }

  @override
  State<AMonthPicker> createState() => _AMonthPickerState();
}

class _AMonthPickerState extends State<AMonthPicker> {
  Future<void> showCalendar() async {
    final value = widget.formKey?.currentState?.getRawValue(widget.name);
    DateTime? initialMonth;
    if (value != null && value is String) {
      initialMonth = DateTime.tryParse(value)?.toLocal();
    }

    final result = await showMonthPicker(
      context: context,
      monthPickerDialogSettings: MonthPickerDialogSettings(
          headerSettings:
              PickerHeaderSettings(headerBackgroundColor: AppColors.primary),
          dialogSettings: const PickerDialogSettings(),
          buttonsSettings: PickerButtonsSettings(
            selectedMonthTextColor: AppColors.white,
            unselectedMonthsTextColor: AppColors.black,
          )),
      initialDate: initialMonth ?? DateTime(DateTime.now().year),
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime(DateTime.now().year + 1),
    );

    if (result != null) {
      final formattedMonth = result.formatDateTime(format: widget.dateFormat!);
      setState(() {
        widget.formKey?.currentState?.patchValue({widget.name: formattedMonth});
      });

      if (widget.onChange != null) {
        widget.onChange!(result);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: showCalendar,
        child: AbsorbPointer(
          child: ATextField(
            name: widget.name,
            isEnabled: widget.isEnabled,
            isRequired: widget.isRequired,
            hintText: widget.hintText,
            labelText: widget.labelText,
            errorText: widget.errorText,
            focusNode: widget.focusNode,
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon,
            onValidate: widget.onValidate,
            onSaved: widget.onSaved,
            onChange: widget.onSaved,
          ),
        ));
  }
}
