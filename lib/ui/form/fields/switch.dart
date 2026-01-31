import 'package:flutter/material.dart';
import 'package:hamewari/main.dart';

class FormSwitchField extends StatefulWidget {
  const FormSwitchField({
    super.key,
    required this.label,
    this.initialValue = false,
  });

  final String label;
  final bool initialValue;

  @override
  State<FormSwitchField> createState() => _FormSwitchFieldState();
}

class _FormSwitchFieldState extends State<FormSwitchField> {
  late bool value;

  @override
  void initState() {
    super.initState();

    value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = context.appTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 16.0,
        children: [
          Text(widget.label, style: appTheme.body),
          Switch(
            value: value,
            activeThumbColor: appTheme.secondaryColor,
            onChanged: (bool newValue) {
              setState(() {
                value = newValue;
              });
            },
          ),
        ],
      ),
    );
  }
}
