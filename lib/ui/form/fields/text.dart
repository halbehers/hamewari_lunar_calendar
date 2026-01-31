import 'package:flutter/material.dart';
import 'package:hamewari/main.dart';

class FormTextField extends StatelessWidget {
  const FormTextField({
    super.key,
    this.hint,
    this.helper,
    this.validator,
    this.minLines,
    this.maxLines,
    this.maxLength,
    this.autofocus = false,
    this.displayCounter = false,
    this.style,
  });

  final String? hint;
  final String? helper;
  final String? Function(String?)? validator;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;
  final bool autofocus;
  final bool displayCounter;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final appTheme = context.appTheme;

    return Padding(
      padding: EdgeInsets.only(
        left: 4.0,
        right: 4.0,
        bottom: displayCounter ? 8.0 : 0.0,
      ),
      child: TextFormField(
        autofocus: autofocus,
        decoration: InputDecoration(
          border: const OutlineInputBorder(borderSide: BorderSide.none),
          hintText: hint,
          helperText: helper,
          hintStyle: appTheme.subduedBody,
          isDense: true,
          counterStyle: appTheme.extraSmallText,
          counter: displayCounter
              ? null
              : SizedBox.fromSize(size: const Size.fromHeight(0.0)),
        ),
        minLines: minLines,
        maxLines: maxLines,
        maxLength: maxLength,
        validator: validator,
        style: style ?? appTheme.body,
      ),
    );
  }
}
