import 'package:flutter/material.dart';
import 'package:hamewari/calendar/date.dart';
import 'package:hamewari/calendar/date_formatter.dart';
import 'package:hamewari/main.dart';
import 'package:wheel_picker/wheel_picker.dart';

class MonthWheel extends StatefulWidget {
  const MonthWheel({
    super.key,
    required this.date,
    this.height = 180,
    this.onDateChanged,
  });

  final Date<dynamic> date;
  final double height;
  final void Function(Date<dynamic> date)? onDateChanged;

  @override
  State<MonthWheel> createState() => _MonthWheelState();
}

class _MonthWheelState extends State<MonthWheel> {
  late final _yearWheel = WheelPickerController(
    itemCount: 4000,
    initialIndex: widget.date.year,
  );
  late final _monthWheel = WheelPickerController(
    itemCount: widget.date.numberOfMonths,
    initialIndex: widget.date.month - 1,
  );

  @override
  Widget build(BuildContext context) {
    final appTheme = context.appTheme;

    final textStyle = appTheme.h3;
    final wheelStyle = WheelPickerStyle(
      itemExtent: textStyle.fontSize! * 1.5, // Text height
      squeeze: 1.25,
      diameterRatio: .8,
      surroundingOpacity: .25,
      magnification: 1.2,
    );

    Widget monthBuilder(BuildContext context, int index) {
      return Text(
        widget.date
            .withMonth(index + 1)
            .format(
              locale: Localizations.localeOf(context),
              pattern: DateFormatter.standaloneMonthPattern,
            ),
        style: textStyle,
      );
    }

    Widget yearBuilder(BuildContext context, int index) {
      return Text("$index", style: textStyle);
    }

    final timeWheels = <Widget>[
      for (final wheelController in [_monthWheel, _yearWheel])
        Expanded(
          child: WheelPicker(
            builder: wheelController == _yearWheel ? yearBuilder : monthBuilder,
            controller: wheelController,
            looping: wheelController == _monthWheel,
            style: wheelStyle,
            selectedIndexColor: appTheme.secondaryColor,
            onIndexChanged: (index, _) {
              if (wheelController == _monthWheel) {
                widget.onDateChanged?.call(widget.date.withMonth(index + 1));
              } else if (wheelController == _yearWheel) {
                widget.onDateChanged?.call(widget.date.withYear(index));
              }
            },
          ),
        ),
    ];

    return Center(
      child: SizedBox(
        height: widget.height,
        child: Stack(
          fit: StackFit.expand,
          children: [
            _centerBar(context),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 72.0),
              child: Row(children: [...timeWheels]),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Don't forget to dispose the controllers at the end.
    _monthWheel.dispose();
    _yearWheel.dispose();
    super.dispose();
  }

  Widget _centerBar(BuildContext context) {
    final appTheme = context.appTheme;

    return Center(
      child: Container(
        height: 32.0,
        decoration: BoxDecoration(
          color: appTheme.borderColor.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
