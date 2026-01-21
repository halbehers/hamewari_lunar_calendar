import 'package:hamewari/calendar/moon_date.dart';
import 'package:hamewari/ui/headers/calendar_header.dart';

class CalendarController {
  CalendarController({
    required this.selectView,
    required this.selectDate,
    required this.setBackButton,
  });

  final void Function({required int viewIndex, MoonDate? date, bool? animate})
  selectView;
  final void Function({required MoonDate date}) selectDate;
  final void Function(CalendarHeaderBackButton?) setBackButton;
}
