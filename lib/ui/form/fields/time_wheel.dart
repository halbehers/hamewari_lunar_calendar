import 'package:flutter/material.dart';
import 'package:hamewari/calendar/date.dart';
import 'package:hamewari/main.dart';
import 'package:wheel_picker/wheel_picker.dart';

class TimeWheel extends StatefulWidget {
  const TimeWheel({
    super.key,
    required this.date,
    this.height = 180,
    this.onTimeChanged,
  });

  final Date<dynamic> date;
  final double height;
  final void Function(Date<dynamic> date)? onTimeChanged;

  @override
  State<TimeWheel> createState() => _TimeWheelState();
}

class _TimeWheelState extends State<TimeWheel> {
  late final _hoursWheel = WheelPickerController(
    itemCount: widget.date.numberOfHoursInDay,
    initialIndex: widget.date.hour,
  );
  late final _minutesWheel = WheelPickerController(
    itemCount: widget.date.numberOfMinutesInHour,
    initialIndex: widget.date.minute,
    mounts: [_hoursWheel],
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

    Widget itemBuilder(BuildContext context, int index) {
      return Text("$index".padLeft(2, '0'), style: textStyle);
    }

    final timeWheels = <Widget>[
      for (final wheelController in [_hoursWheel, _minutesWheel])
        Expanded(
          child: WheelPicker(
            builder: itemBuilder,
            controller: wheelController,
            looping: true,
            style: wheelStyle,
            selectedIndexColor: appTheme.secondaryColor,
            onIndexChanged: (index, _) {
              if (wheelController == _hoursWheel) {
                widget.onTimeChanged?.call(widget.date.withHour(index));
              } else if (wheelController == _minutesWheel) {
                widget.onTimeChanged?.call(widget.date.withMinute(index));
              }
            },
          ),
        ),
    ];
    timeWheels.insert(1, Text(":", style: textStyle));

    return Center(
      child: SizedBox(
        height: widget.height,
        child: Stack(
          fit: StackFit.expand,
          children: [
            _centerBar(context),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 86.0),
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
    _hoursWheel.dispose();
    _minutesWheel.dispose();
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
