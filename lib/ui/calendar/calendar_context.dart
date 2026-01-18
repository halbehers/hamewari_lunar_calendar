import 'package:hamewari/calendar/moon_date.dart';
import 'package:hamewari/ui/headers/calendar_header.dart';

class CalendarController {
  CalendarController({required this.changeView, required this.setBackButton});

  final void Function({
    required int viewIndex,
    required MoonDate date,
    bool? animate,
  })
  changeView;
  final void Function(CalendarHeaderBackButton?) setBackButton;
}
